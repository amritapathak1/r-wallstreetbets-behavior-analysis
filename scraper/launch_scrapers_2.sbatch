#!/bin/bash
#SBATCH --job-name=amrita_final_scrape
#SBATCH --output=amrita_final_scrape_%a.out
#SBATCH --error=amrita_final_scrape_%a.err
#SBATCH --account=macs40123
#SBATCH --partition=caslake

#SBATCH --array=28-33
#SBATCH --ntasks=1
#SBATCH --mem=32G

module load python/anaconda-2022.05
pip install --user zstandard

IDX=$SLURM_ARRAY_TASK_ID

# Hard-coded year/month ranges
case "$IDX" in
    28)
        YEAR=2021; START=7; END=9
        ;;
    29)
        YEAR=2021; START=10; END=12
        ;;
    30)
	YEAR=2022; START=1; END=3
	;;
    31)
    	YEAR=2022; START=4; END=6
	;;
    32)
	YEAR=2022; START=7; END=9
	;;
    33)
	YEAR=2022; START=10; END=12
	;;
esac

echo "Running scraper for ${YEAR}, months ${START}-${END}"
python ./scraper.py --year $YEAR --start_month $START --end_month $END
