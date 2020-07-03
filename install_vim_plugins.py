import os
import subprocess

dot_dir = os.path.expanduser("~/dots")
home_dir = os.path.expanduser("~")
filepath = ''
for p, _, f in os.walk(dot_dir):
    if ".vimrc" in f:
        filepath = p+"/.vimrc"

if not filepath:
    raise Exception("Couldn't find vimrc!")

plugin_names = []
with open(filepath) as f:
    for line in f:
        if "Plug" in line and line.split()[0] != '"':
            plugin_names.append(line.split()[1].strip(",").strip("'"))

plugin_dir =  os.path.join(home_dir, ".vim/pack/plugins/opt") 
if not os.path.isdir(plugin_dir):
    os.makedirs(plugin_dir)

for repo in plugin_names:
    print(repo)
    x = subprocess.run(["git", "clone", "https://github.com/"+repo], cwd=plugin_dir)
    if x.returncode != 0:
        subprocess.run(["git","pull", "--ff-only"], cwd=os.path.join(plugin_dir, repo.split("/")[1]) )
