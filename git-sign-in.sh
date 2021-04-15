#!bash
echo "Input what you want:"
echo "1) Generate new keys"
echo "2) Use pre-existing keys"
read val

if [ $val -eq '1' ]; 
then
        #generating keys
        gpg --gen-key    
        echo "Enter your key: "
        read yourkey
        gpg --armor --export $yourkey   
        git config --global user.signingkey $yourkey    
elif [ $val -eq '2' ]; 
then
        #listing keys
        gpg --list-keys
        echo "Enter your key: "
        read yourkey
        gpg --armor --export $yourkey   
fi

#reading keys

echo "Copy and paste this key on your github"

echo "Change directory to repo:"
read dir
cd $dir

#adding the repo
git add .
echo "Your message: "

#commit
read message
git commit -m "$message" -s

echo "Enter your branch"
read branch

#push
git push -u origin $branch
