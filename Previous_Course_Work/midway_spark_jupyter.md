# Midway Spark

### On Compute Node

Setup env (should not need to do this every time, already set up once):
```
module load python/anaconda-2023.09 java/17.0.10 scode
source activate rapids-24.12
python -m ipykernel install --user --name rapids-24.12 --display-name "Python (rapids-24.12)"
```

Start Jupyter Lab:
```
HOST_IP=`/sbin/ip route get 8.8.8.8 | awk '{print $7;exit}'`
PORT_NUM=$(shuf -i15001-30000 -n1)
jupyter-notebook --no-browser --ip=$HOST_IP --port=$PORT_NUM
```

In a Jupyter Notebook:

Change kernel to Python (rapids-24.12)
Then run pyspark as usual
```
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("ITR1_amritap1").getOrCreate()
```
