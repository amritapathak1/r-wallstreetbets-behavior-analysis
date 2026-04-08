import argparse
import zstandard
import os
import json
from datetime import datetime


def read_and_decode(reader, chunk_size, max_window_size, previous_chunk=None, bytes_read=0):
	chunk = reader.read(chunk_size)
	bytes_read += chunk_size
	if previous_chunk is not None:
		chunk = previous_chunk + chunk
	try:
		return chunk.decode()
	except UnicodeDecodeError:
		if bytes_read > max_window_size:
			raise UnicodeError(f"Unable to decode frame after reading {bytes_read:,} bytes")
		print(f"Decoding error with {bytes_read:,} bytes, reading another chunk")
		return read_and_decode(reader, chunk_size, max_window_size, chunk, bytes_read)


def read_lines_zst(file_name):
	with open(file_name, 'rb') as file_handle:
		buffer = ''
		reader = zstandard.ZstdDecompressor(max_window_size=2**31).stream_reader(file_handle)
		while True:
			chunk = read_and_decode(reader, 2**27, (2**29) * 2)
			if not chunk:
				break
			lines = (buffer + chunk).split("\n")
			for line in lines[:-1]:
				yield line, file_handle.tell()
			buffer = lines[-1]
		reader.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--year', type=int, required=True,
                        help='Year of data to scrape.')
    parser.add_argument('--start_month', type=int, required=True,
                        help='Start month of data to scrape.')
    parser.add_argument('--end_month', type=int, required=True,
                        help='End month of data to scrape.')

    args = parser.parse_args()
    source_path = "/project/jevans/hongkai/reddit"
    dest_path = "/project/macs40123/amritap1/data"
	
    for filetype, src in [("RS", "submissions")]:
        for month in range(args.start_month, args.end_month + 1):
            filename = f"{filetype}_{args.year}-{month:02d}"
            file_size = os.path.getsize(f"{source_path}/{src}/{filename}.zst")

            file_lines = 0
            file_bytes_processed = 0
            created = None
            field = "subreddit"
            value = "wallstreetbets"
            bad_lines = 0

            with open(f"{dest_path}/{src}/{filename}_subreddit.json", 'w') as file_written:
                for line, file_bytes_processed in read_lines_zst(f"{source_path}/{src}/{filename}.zst"):
                    try:
                        obj = json.loads(line)
                        created = datetime.utcfromtimestamp(int(obj['created_utc']))
                        if obj[field] == value:
                            file_written.write(json.dumps(obj) + '\n')
                    except (KeyError, json.JSONDecodeError) as err:
                        bad_lines += 1
                    file_lines += 1
                    if file_lines % 100000 == 0:
                        print(f"{created.strftime('%Y-%m-%d %H:%M:%S')} : {file_lines:,} : {bad_lines:,} : {file_bytes_processed:,} : {(file_bytes_processed / file_size) * 100:.0f}%")

