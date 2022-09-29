BASE_USERNAME="shadowplay1"

read -p "Enter a repository you want to clone: " repo_name
read -p "Enter your GitHub token: " github_token

cloning_status=$(git clone https://$BASE_USERNAME:$github_tokenX@github.com/$BASE_USERNAME/$repo_name.git > /dev/null 2>&1)

if ! ${cloning_status}; then
	echo
	echo "An error has occured."

	exit 1
fi

echo
echo "Repository was cloned successfully!"

exit 0
