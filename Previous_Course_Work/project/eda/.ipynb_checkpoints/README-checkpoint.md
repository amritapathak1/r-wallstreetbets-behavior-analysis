> ssh amritap1@midway3.rcc.uchicago.edu

> module unload python
>
> conda deactivate

> module load python
> 
> pip install --user dask[complete]==2022.7.0 dask-jobqueue==0.7.4 dask-ml==2022.5.27
> 
> pip install --user --force-reinstall --upgrade jupyter
> 
> HOST_IP=\`/sbin/ip route get 8.8.8.8 | awk '{print $7;exit}'`
> 
> PORT_NUM=$(shuf -i15001-30000 -n1)
> 
> jupyter-lab --no-browser --ip=$HOST_IP --port=$PORT_NUM
