#!/bin/bash
#SBATCH --job-name=amrita_final_scrape
#SBATCH --output=amrita_final_scrape_%a.out
#SBATCH --error=amrita_final_scrape_%a.err
#SBATCH --account=ssd
#SBATCH --partition=ssd
#SBATCH --qos=ssd
#SBATCH --array=0-5
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G

module load python/anaconda-2022.05
pip install --user zstandard

# =========================
# EDIT THIS SECTION ONLY
# =========================
# Format:
# YEAR:START:END:SCRIPT

TASKS=(
    "2022:1:3:scraper.py"
    "2022:4:6:scraper.py"
    "2021:7:9:scraper.py"
    "2021:10:12:scraper.py"
    "2022:7:9:scraper.py"
    "2022:10:12:scraper.py"
)

TRACKER="scrape_tracker.tsv"

# =========================
# DO NOT EDIT BELOW
# =========================

IDX=$SLURM_ARRAY_TASK_ID
TASK="${TASKS[$IDX]}"

if [ -z "$TASK" ]; then
    echo "No task found for array index $IDX"
    exit 1
fi

IFS=":" read -r YEAR START END SCRIPT <<< "$TASK"

echo "Running $SCRIPT for YEAR=$YEAR, months $START-$END"

# create tracker file once
if [ ! -f "$TRACKER" ]; then
    echo -e "array_id\tyear\tstart_month\tend_month\tscript\tstatus\tstart_time\tend_time" > "$TRACKER"
fi

START_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# log start
echo -e "${IDX}\t${YEAR}\t${START}\t${END}\t${SCRIPT}\tRUNNING\t${START_TIME}\t" >> "$TRACKER"

# run scraper
python ./"$SCRIPT" --year "$YEAR" --start_month "$START" --end_month "$END"
EXIT_CODE=$?

END_TIME=$(date '+%Y-%m-%d %H:%M:%S')

if [ $EXIT_CODE -eq 0 ]; then
    STATUS="COMPLETED"
else
    STATUS="FAILED"
fi

# log finish
echo -e "${IDX}\t${YEAR}\t${START}\t${END}\t${SCRIPT}\t${STATUS}\t${START_TIME}\t${END_TIME}" >> "$TRACKER"

exit $EXIT_CODE