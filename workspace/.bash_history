ls -la
cd monad_project
node main.js
git status
git add .
git commit -m "Initial commit"
git push origin main
cd ../scripts
./deploy.sh
cd ../..
ls -a
cat .bash_history
cd archive
ls
tar -xvf data_dump.tar.gz
cat README.txt
cat secret_formula.txt
cd ..
cd workspace
vi notes.txt
grep "password" monad_project/config.json
awk -f scripts/log_parser.awk ../archive/access_log.old
history
