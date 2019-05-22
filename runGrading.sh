input_dir=$1;
output_dir=$2;
assignment_name=$3;

<<<<<<< HEAD
python preprocess-add-grade.py $input_dir $output_dir $assignment_name;

for notebook in $output_dir/*.ipynb;
do
    echo "Now executing:" $notebook "🤔";
    jupyter nbconvert --to notebook --inplace --execute $notebook;
    echo "Notebook:" $notebook "executed 🎉🎊";
done

echo "All notebooks autograded and executed 🎉🎊"
=======
rm log.txt

python preprocess-add-grade.py $input_dir $output_dir $assignment_name 2>&1 | tee -a log.txt;

for notebook in $output_dir/*.ipynb;
do
    echo "Now executing:" $notebook "🤔" 2>&1 | tee -a log.txt;
    jupyter nbconvert --to notebook --inplace --execute $notebook 2>&1 | tee -a log.txt;
    echo "Notebook:" $notebook "executed 🎉🎊" 2>&1 | tee -a log.txt;
done;

python upload_tests.py $output_dir $assignment_name 2>&1 | tee -a log.txt

echo "All notebooks autograded and executed 🎉🎊" 2>&1 | tee -a log.txt
>>>>>>> upstream/master
