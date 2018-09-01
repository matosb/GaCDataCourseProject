<h1>CodeBook for the Course Project</h1>
<p>This codebook describes :</p>
<ol>
 <li>The data and the variables</li>
 <li>The variables</li>
 <li>Any transformations or work that were performed to clean up the data</li>
</ol>

<h2>The data and the variables</h2>
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">They were collected from the accelerometers from the Samsung Galaxy S smartphone</a>
<p>On this dataset we have 10.299 rows and 561 columns</p>

<h2>Any transformations or work that were performed to clean up the data</h2>
<h3>1. Merges the training and the test sets to create one data set.</h3>
<ul>Loading training data :
  <li>../UCI HAR Dataset/train/X_train.txt</li>
  <li>../UCI HAR Dataset/train/y_train.txt</li>
  <li>../UCI HAR Dataset/train/subject_train.txt</li>
</ul>
<ul>Loading testing data :
  <li>../UCI HAR Dataset/test/X_test.txt</li>
  <li>../UCI HAR Dataset/test/y_test.txt</li>
  <li>../UCI HAR Dataset/test/subject_test.txt</li>
</ul>

<p>Merging training and testing data</p>

<h3>2. Extracts only the measurements on the mean and standard deviation for each measurement.</h3>

<h3>3. Appropriately labels the data set with descriptive variable names
and uses descriptive activity names to name the activities in the data set</h3>

<h3>4. From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</h3>

