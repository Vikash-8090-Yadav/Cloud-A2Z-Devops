# S3 Amzon Service used for Storage 


### S3 (Simple Storage Service) in Amazon Web Services (AWS) is a highly scalable, secure, and durable object storage service that allows you to 
store and retrieve any amount of data from anywhere on the web. While it is commonly used for storing static website content, such as images,
videos, and HTML files, it can also be used to store and manage any kind of unstructured data, including backups, log files, archives, and data lakes.

S3 is designed to provide a high level of durability and availability for your data, with data stored across multiple facilities and devices within 
an AWS region to provide redundancy and minimize the risk of data loss. S3 also offers a range of security features, such as server-side encryption, 
access controls, and bucket policies, to help you secure your data and comply with regulatory requirements.

<br>

<b> In addition to storing data, S3 can also be integrated with other AWS services to build scalable, flexible, and cost-effective solutions. For example:
<br><br>

<li>
EC2 (Elastic Compute Cloud) instances can access data stored in S3 to run applications, perform batch processing, or analyze big data.
</li>
<li>
AWS Lambda functions can be triggered by S3 events, such as object creation or deletion, to automate workflows and reduce manual tasks.
</li>

<li>
Amazon CloudFront can be used to distribute content stored in S3 to edge locations around the world for faster access and lower latency.
</li>
<li>
AWS Glue can extract, transform, and load data stored in S3 into data lakes or analytics platforms for business intelligence or machine learning.
</li>

<br> 
</b>
Overall, S3 is a versatile and reliable storage service that can be used to store and manage any kind of data, and can be integrated with a wide range of
AWS services to build scalable, flexible, and cost-effective solutions for your business.


## IMages 
1. I uoloaded the idex.hmtl file in the bucket 

![Screenshot from 2023-04-09 22-48-35](https://user-images.githubusercontent.com/85225156/230788268-fc96c04a-d426-4382-96e0-39e975bce268.png)

2. After enabling web static hosting and editing bucket policy that is given below .


```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::YOUR-S3-BUCKETNAME/*"
        }
    ]
}
```


![Screenshot from 2023-04-09 22-43-04](https://user-images.githubusercontent.com/85225156/230788303-2a450bf0-328c-41d0-a116-e41e8006a458.png)

3. After creating all the scuessfull changes  the resukt is this !! . THe site is running on the public adress provided by the aws  web stattic hosting !! 

![Screenshot from 2023-04-09 22-43-34](https://user-images.githubusercontent.com/85225156/230788302-19f3c68e-5ec8-4713-98aa-0eb5ce30c28f.png)


