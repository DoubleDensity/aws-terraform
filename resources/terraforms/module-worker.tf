module "worker" {
    source = "../modules/worker"

    image_type = "t2.micro"
    cluster_desired_capacity = 1
    root_volume_size =  8
    ebs_volume_size =  12
    keypair = "worker"
    allow_ssh_cidr="0.0.0.0/0"

    # aws
    aws_account_id="${var.aws_account.id}"
    aws_region = "us-west-2"
    ami = "${lookup(var.amis, "us-west-2")}"

    # vpc
    vpc_id = "${module.vpc.vpc_id}"
    vpc_cidr = "${module.vpc.vpc_cidr}"
    vpc_route_table = "${module.vpc.vpc_route_table}"
    worker_subnet_a_id = "${module.vpc.worker_subnet_a_id}"
    worker_subnet_b_id = "${module.vpc.worker_subnet_b_id}"
    worker_subnet_c_id = "${module.vpc.worker_subnet_c_id}"
    worker_subnet_az_a = "${module.vpc.worker_subnet_az_a}"
    worker_subnet_az_b = "${module.vpc.worker_subnet_az_b}"
    worker_subnet_az_c = "${module.vpc.worker_subnet_az_c}"
}