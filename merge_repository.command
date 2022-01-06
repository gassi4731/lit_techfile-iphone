echo "Please enter repository name"
read name

echo "Please enter branch name"
read branchName

git fetch $name
git read-tree --prefix=$name/ $name/$branchName
git checkout -- .
git add .
git commit -m "add $name"
git merge -s subtree $name/$branchName --allow-unrelated-histories
