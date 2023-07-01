# AWS Elastic Container Registry (ECR)

AWS Elastic Container Registry (ECR) is a fully managed container registry service provided by Amazon Web Services (AWS). It allows you to store, manage, and deploy Docker container images.

## Features

- **Private Container Image Repository:** ECR provides a secure and private repository to store your container images. You can control access using AWS Identity and Access Management (IAM) and manage image lifecycle policies.

- **Integration with AWS Services:** ECR seamlessly integrates with other AWS services such as Amazon Elastic Container Service (ECS), Amazon Elastic Kubernetes Service (EKS), AWS Fargate, AWS CodeBuild, and AWS CodePipeline, making it easier to build, deploy, and manage your containerized applications.

- **Scalable and Highly Available:** ECR is designed to be highly available and scalable. It automatically scales to meet the demand of pulling and pushing container images and provides durability and availability of your container image data.

- **Image Vulnerability Scanning:** ECR provides an integrated image scanning feature that helps identify vulnerabilities and provides actionable insights. It integrates with services like AWS Security Hub and Amazon CloudWatch to notify and take appropriate actions based on scan findings.

- **Lifecycle Policies:** ECR allows you to define lifecycle policies to manage your container images automatically. You can define rules to expire or delete old images based on criteria such as age or image count.

## Getting Started

To get started with ECR, you can follow these steps:

1. **Create an ECR Repository:** Create a repository to store your container images using the AWS Management Console, AWS CLI, or AWS SDKs.

2. **Push Container Images:** Push your Docker container images to the ECR repository using the `docker push` command or tools like AWS CLI, AWS SDKs, or container orchestration services like Amazon ECS or Amazon EKS.

   To push an image to ECR, follow these steps:
   
   - Install and configure the AWS CLI if you haven't already.
   - Build your Docker image using the `docker build` command.
   - Tag your image with the ECR repository URI. The URI should follow the format: `<aws_account_id>.dkr.ecr.<region>.amazonaws.com/<repository_name>`
   - Authenticate Docker with ECR using the `aws ecr get-login-password` command to retrieve an authentication token. (Example: `aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com`)
   - Push the tagged image to ECR using the `docker push` command. (Example: `docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/<repository_name>`)
   
3. **Pull Container Images:** Pull container images from the ECR repository using the `docker pull` command or by referencing the ECR repository URI in your deployment configurations.

4. **Manage Access:** Control access to your ECR repositories using IAM policies. You can manage user and group permissions to push, pull, and manage images.

5. **Integrate with Other AWS Services:** Integrate ECR with other AWS services like Amazon ECS, Amazon EKS, AWS Fargate, AWS CodeBuild, and AWS CodePipeline to streamline your containerized application development and deployment workflows.

For detailed information on ECR features, API references, and examples, refer to the [AWS ECR Documentation](https://docs.aws.amazon.com/ecr/).

## Pricing

ECR pricing is based on storage and data transfer. For the latest pricing details, refer to the [AWS ECR Pricing](https://aws.amazon.com/ecr/pricing/) page.

## Resources

Here are some useful resources to learn more about AWS Elastic Container Registry (ECR):

- [AWS ECR Documentation](https://docs.aws.amazon.com/ecr/)
- [AWS ECR API Reference](https://docs.aws.amazon.com/ecr/api/)
- [AWS ECR Developer Guide](https://docs.aws.amazon.com/AmazonECR/latest/developerguide/)
