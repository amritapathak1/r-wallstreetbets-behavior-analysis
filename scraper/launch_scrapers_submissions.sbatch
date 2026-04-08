#!/bin/bash
#SBATCH --job-name=amrita_final_scrape
#SBATCH --output=amrita_final_scrape_%a.out
#SBATCH --error=amrita_final_scrape_%a.err
#SBATCH --account=macs40123
#SBATCH --partition=caslake

#SBATCH --array=34-38
#SBATCH --ntasks=1
#SBATCH --mem=16G

module load python/anaconda-2022.05
pip install --user zstandard

IDX=$SLURM_ARRAY_TASK_ID

# Hard-coded year/month ranges
case "$IDX" in
    34)
        YEAR=2019; START=1; END=1
        ;;
    35)
        YEAR=2019; START=7; END=7
        ;;
    36)
	YEAR=2020; START=1; END=1
	;;
    37)
    	YEAR=2020; START=7; END=7
	;;
    38)
	YEAR=2021; START=1; END=1
	;;
esac

echo "Running submissions scraper for ${YEAR}, months ${START}-${END}"
python ./scraper_submissions.py --year $YEAR --start_month $START --end_month $END
