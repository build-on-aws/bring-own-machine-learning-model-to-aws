# Bring your own machine learning code to AWS

Running your own machine learning code on AWS requires thinking about needed infrastructure, packaging the code and AWS Services to use.

In this code repository, we present different methods leveraging [Amazon Sagemaker](https://aws.amazon.com/sagemaker/) to execute the data scientists code on AWS:

- **Bring your own Script:** In this scenario, your data science team has already built a python script but wants to take advantage of the elasticity of the cloud and the SageMaker prebuilt containers. 
- **Bring your own Container:** In this scenario, your team has implemented its own code but also its own docker container with specific libraries installed.
- **Remote jobs:** In this scenario, your team has implemented its own script with specific dependencies and wants to run it on AWS with minimal changes and continue developing on the local development set-up while leveraging the SageMaker ecosystem.

The notebook example **sklearn_byom.ipynb** shows how to train a scikit-learn model using the three mentioned methods.

## ⚙️ Setup
You can go to the notebook **sklearn_byom.ipynb** and start executing the cells after you make sure your execution environment is ready:

- An [AWS account](http://docs.aws.amazon.com/sagemaker/latest/dg/gs-account.html)
- Proper [IAM Role](http://docs.aws.amazon.com/sagemaker/latest/dg/authentication-and-access-control.html) setup with SageMaker permissions, access to Amazon S3 in your account and access to Amazon ECR.
- An [Amazon SageMaker Notebook Instance](http://docs.aws.amazon.com/sagemaker/latest/dg/gs-setup-working-env.html) or an [Amazon Sagemaker Studio domain and user profile](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-onboard.html). This is the IDE you can use to run the code.

## ⬆️ Steps:

### 1.Create a sagemaker notebook instance or a sagemaker studio domain and user profile
If you want to execute the notebook in Amazon SageMaker Notebook instance:
1. In the AWS Console, go to Amazon SageMaker service.
2. Choose Notebook > Notebook instances.
3. Click on "Create notebook instance".
4. Enter a Notebook instance name.
5. Choose an IAM role that has permissions to Amazon S3 and Amazon ECR.
6. Click "Create notebook instance" to validate creation.

If you want to execute the notebook in Amazon Sagemaker Studio:
1. In the AWS Console, go to Amazon SageMaker service.
2. Choose Domains
3. If not already provisioned, Create a domain.
4. Create a user profile with an IAM role that has permissions to Amazon S3 and Amazon ECR.
5. Choose the user profile, click "Launch" and choose "Studio"

### 2. Clone the repository

In a terminal, execute:

``git clone https://github.com/build-on-aws/bring-own-machine-learning-model-to-aws``

### 3. Start executing the notebook
Choose the notebook **sklearn_byom.ipynb**
#### a. Data preparation 
In this part of the notebook, we prepare and clean the dataset we work on: **Iris Dataset** and split it to train and test datasets.
Finally, we push data to an S3 location.

#### b. Bring your own script
In this section, we leverage [Amazon Sagemaker provided containers](https://docs.aws.amazon.com/sagemaker/latest/dg/docker-containers-prebuilt.html) and the data scientist provided script **train.py** to train the model in AWS.

#### c. Bring your own container
In this section, we want to have custom dependencies. Therefore, we create an Amazon ECR image from a provided Dockerfile.

N.B: In Amazon Sagemaker notebook instance, use the **build_and_push.sh** script and if you are executing the code in Amazon Sagemaker studio, use the **build_and_push_studio.sh** as mentioned in the notebook.

We then create a Sagemaker training job leveraging the newly created ECR image.

#### c. Amazon Sagemaker remote job
In this section, we discover a straighforward way to execute a script in AWS leveraging Amazon sagemaker training jobs, through simply defining the job configuration (networking, permissions, needed packages) and using @remote decorator on the code.

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.
## License

This project is licensed under the MIT-0 License. See the [LICENSE](./LICENSE) file.
