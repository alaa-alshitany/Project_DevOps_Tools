vpc_cidr          = "10.0.0.0/16"
region            = "eu-west-2"
ses_email_reciever = "@gmail.com"
common_resource_name = "project"
environment = "Dev"
machine_data={
    type="t2.micro",
    public_ip=true
}

subnets_data=[
    {
        name="public_subnet_1",
        cidr="10.0.1.0/24",
        type="public",
        az = "eu-west-2a",
        map_public_ip_on_launch = true
    },

    {
        name="public_subnet_2",
        cidr="10.0.2.0/24",
        type="public",
        az = "eu-west-2b",
        map_public_ip_on_launch = true
    },

    {
        name="private_subnet_1",
        cidr="10.0.3.0/24",
        type="private",
        az = "eu-west-2a",
        map_public_ip_on_launch = false
    },
    {
        name="private_subnet_2",
        cidr="10.0.4.0/24",
        type="private",
        az = "eu-west-2b",
        map_public_ip_on_launch = false
    }
]
