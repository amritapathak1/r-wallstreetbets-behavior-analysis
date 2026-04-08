#!/bin/bash
#SBATCH --job-name=amrita_final_scrape
#SBATCH --output=amrita_final_scrape_%a.out
#SBATCH --error=amrita_final_scrape_%a.err
#SBATCH --account=macs40123
#SBATCH --partition=caslake

# spawn 10 separate array‐tasks, each with ntasks=1
#SBATCH --array=0-7
#SBATCH --ntasks=1

module load python/anaconda-2022.05
pip install --user zstandard

# map SLURM_ARRAY_TASK_ID 0..7 → year/month‐range
IDX=$SLURM_ARRAY_TASK_ID
YEAR=$((2019 + IDX/2))
if (( IDX % 2 == 0 )); then
    START=1; END=6
else
    START=7; END=12
fi

echo "Running scraper for ${YEAR}, months ${START}-${END}"
python ./scraper.py --year $YEAR --start_month $START --end_month $END
