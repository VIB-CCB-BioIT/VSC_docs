# Typical start-of-day workflow of working on the VSC using VS Code.

For these steps you need to have obtained a VSC account, added as a member for a project (payment group), the ssh config file (available here [insert]), and vs code installed 
Also note that the screenshots will most likely not reflect how your terminal/VScode/command prompt looks like.


1. Open local terminal
2. Login to the login node: `ssh login` - after logging in the genius login-screen should appear.
   <img width="563" alt="image" src="https://github.com/user-attachments/assets/2921f743-0f0d-41ab-a4a2-0b4ba9600fda">
4. Open `tmux` or `screen` session. 
       tmux will be used in this example but either works.
        `tmux` or `tmux attach -t ${session_id}` if you already have a running tmux session that you want to use
    <img width="646" alt="image" src="https://github.com/user-attachments/assets/093b4839-67eb-42a6-b34a-0354f3b22e03">
    <img width="646" alt="image" src="https://github.com/user-attachments/assets/8b39fc51-6bf7-48d6-ac70-2f012de5d4ea">
    
5. Request a compute node. In this example we will request 1 node with 1 core and 5GB of memory for 1 hour. This is just an example and in reality you will be requesting more.
    
    This is submitting a job to the `batch` nodes using the lab of integrative genomics payment account `lp_lig` 
    `srun -n 1 -c 1 --mem 10G --time=1:00:00 -A lp_lig -p batch --cluster wice --pty bash -l`
    <img width="646" alt="image" src="https://github.com/user-attachments/assets/619ed127-b84f-4efa-9f53-842ff1cb2352">

    
6. Detach tmux session `control + b` followed by `d`. This ensures that your job stays alive for the entire duration, even if your local computer/laptop disconnects from the internet or goes to sleep.
7. Check the node you have been assigned `squeue --cluster wice` and copy the node name specified under `NODELIST (REASON)` 
    
    <img width="646" alt="image" src="https://github.com/user-attachments/assets/317f68df-465a-4040-b5fb-5557f006f18f">
    
9. Launch VS Code and at the bottom left, click the blue remote-connect button and select `connect to host` or `connect current window to host` if you don’t want to open a new VS Code window. If this doesn’t show up, you might have to select `ssh` in the dropdown menu first. See screenshots below


<img width="1018" alt="vs_2" src="https://github.com/user-attachments/assets/957b9afe-1464-482d-9bd4-5ead8cd8b4cd">

<img width="1018" alt="vs_2" src="https://github.com/user-attachments/assets/7387695d-a0cd-48a5-a1fb-2913ebdb7631">

<img width="1018" alt="vs_3" src="https://github.com/user-attachments/assets/82b5d6b1-cb91-4695-b342-979ec8d26814">


1. After connecting you should see that you’re connected to the login node at the bottom left of the screen (see screenshot). Initial connecting to a login node might take a minute

<img width="1018" alt="vs_4" src="https://github.com/user-attachments/assets/f1f64791-85ea-4a71-a2e1-3fa8f9d3ba49">

Common errors:

1. Unable to connect to host. After trying to connect to your compute node, it errors after a while
    
    Potential fixes:
    
    1. Your `$VSC_HOME` is full. Make sure that you have enough space for VS Code to download a few files to your home directory (a couple of Mb should be enough).
    2. The node you are trying to ssh into is not in your ssh config file. This should also show up as the node not showing up in the list after clicking `Connect to host` . Make sure that all the nodes that you might connect to are included in your configuration file on the computer that you’re trying to connect with (not on the VSC). The file is typically located in `~/.ssh/config`
