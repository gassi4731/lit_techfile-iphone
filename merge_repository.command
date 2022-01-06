echo "Please enter repository name"
read name

git fetch child_repo1
git read-tree --prefix=$name/ $name/master
git checkout -- .
git add .
git commit -m “add $name”
git merge -s subtree $name/master --allow-unrelated-histories
