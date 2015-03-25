# -----------------------------------
# Script that builds Dart app and pushes it to gh-pages.
#
# Set following variables:
# -----------------------------------
build_folder='web'
github_repo='git@github.com:marcojakob/tutorial-dart-kanban.git'

# -----------------------------------
# Build.
# -----------------------------------
pub install
pub build ${build_folder}

# -----------------------------------
# Configure git in build subfolder
# -----------------------------------
cd build/${build_folder}
git init
git add .

# -----------------------------------
# Deploy to github pages.
# -----------------------------------
git commit -m 'deploy commit from drone'
git push -f ${github_repo} master:gh-pages