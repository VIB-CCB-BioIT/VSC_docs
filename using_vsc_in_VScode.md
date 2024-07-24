Typical daily workflow of working on the VSC using VS Code.

For these steps you need to have obtained a VSC account, added as a member for a project (payment group), the ssh config file and vs code installed 

1. Open local terminal
2. Login to the login node: `ssh login`
3. Open `tmux` or `screen` session. 
4. tmux will be used in this example but either works.
    
    `tmux` or `tmux attach -t ${session_id}` if you already have a running tmux session that you want to use
    
5. Request a compute node. In this example we will request 1 node with 1 core and 5GB of memory for 1 hour. This is just an example and in reality you will be requesting more.
    
    This is submitting a job to the `batch` nodes using the lab of integrative genomics payment account `lp_lig` 
    `srun -n 1 -c 1 --mem 10G --time=1:00:00 -A lp_lig -p batch --cluster wice --pty bash -l`
    
6. Detach tmux session `control + b` followed by `d` 
7. Check the node you have been assigned `squeue --cluster wice` and copy the node name specified under `NODELIST (REASON)` 
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/0e2edaab-8abf-4a7f-855c-48e1ff0d3d94/47511824-40ad-432c-b981-2b0f46fb6999/Untitled.png)
    
8. Launch VS Code and at the bottom left, click the blue remote-connect button and select `connect to host` or `connect current window to host` if you don’t want to open a new VS Code window. If this doesn’t show up, you might have to select `ssh` in the dropdown menu first. See screenshots below

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/0e2edaab-8abf-4a7f-855c-48e1ff0d3d94/82153fad-39b6-4863-8753-dc332af4ff08/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/0e2edaab-8abf-4a7f-855c-48e1ff0d3d94/66f8238a-3b36-4fd4-bf6b-78d0eefbe7e2/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/0e2edaab-8abf-4a7f-855c-48e1ff0d3d94/78f0dcaf-9a35-4e31-a7b4-554ce7438a3b/Untitled.png)

1. After connecting you should see that you’re connected to the login node at the bottom left of the screen (see screenshot). Initial connecting to a login node might take a minute

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/0e2edaab-8abf-4a7f-855c-48e1ff0d3d94/9c1ed3e8-c816-48c5-95d5-cf422519b87e/Untitled.png)

Common errors:

1. Unable to connect to host. After trying to connect to your compute node, it errors after a while
    
    Potential fixes:
    
    1. Your `$VSC_HOME` is full. Make sure that you have enough space for VS Code to download a few files to your home directory (a couple of Mb should be enough).
    2. The node you are trying to ssh into is not in your ssh config file. This should also show up as the node not showing up in the list after clicking `Connect to host` . Make sure that all the nodes that you might connect to are included in your configuration file on the computer that you’re trying to connect with (not on the VSC). The file is typically located in `~/.ssh/config`
