# EC2+S3
ec2  basically  creates the various instance (virtual machine) to u so that u can perform next task from linux , window and ubuntu macines of your selected choice . 

Amazon Elastic Compute Cloud (EC2) is a web service that provides resizable compute capacity in the cloud. In simple terms, it allows you to rent virtual servers (known as instances) to run your applications and services.

Using EC2, you can choose from a variety of instance types, including Linux, Windows, and Ubuntu machines. You can also select the amount of CPU, memory, storage, and networking capacity that your instance needs.

EC2 also provides various features like auto-scaling, load balancing, and security groups to ensure that your applications are highly available, scalable, and secure.

Below is the image of the EC2 , Showing the pun=blic ip adress of the instance that i have created , 

![Screenshot from 2023-04-11 23-03-50](https://user-images.githubusercontent.com/85225156/231245473-49ebb5bb-520a-4279-bef1-a42a69255b10.png)

To understand how , this website is running in ec2 instance take  a look on the below points :
1.I have uploaded the site template zip folder  on the S3 bucket ,and then i am acessing the s3 zip folder in ec2 insance by using the command 
```
curl -O public-link-of-the-zip 
```

![Screenshot from 2023-04-11 23-05-58](https://user-images.githubusercontent.com/85225156/231245408-ceb2fad6-663b-4c25-8b8d-cdab9361de5c.png)

then  to run the html (index.html) am using `lite-server` tool . as it run the site directly to the server without any  breakpoint .

Below is the images showignt  the public ip address of the image and it's expose on the 3000 port ,  you can do this by setting the security group in the EC2 . 
![Screenshot from 2023-04-11 23-04-22](https://user-images.githubusercontent.com/85225156/231245418-bfbc2f7b-a122-42e3-a1f5-cce64a073001.png)


# In the Next Task I will use the lambda service and explore that part !! 
