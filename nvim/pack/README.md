Delete the relevant line from the .gitmodules file.
Delete the relevant section from .git/config.
git rm --cached path_to_submodule (no trailing slash).
git submodule deinit submodule
Commit and delete the now untracked submodule files.

git submodule add -b main URL path
git submodule init
git submodule update --remote

git submodule deinit -f -- path
rm -rf .git/module/path
git rm -f path

