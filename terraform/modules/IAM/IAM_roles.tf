#Policy document specifying what service can assume the role
data "aws_iam_policy_document" "WP-Role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "WP-Role" {
  name                = "WP-Role"
  assume_role_policy  = data.aws_iam_policy_document.WP-Role.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy", "arn:aws:iam::aws:policy/AmazonSSMFullAccess", "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientFullAccess"]
}

resource "aws_iam_instance_profile" "WP-Instance-Profile" {
  name = "WP_Instance_Profile"
  role = aws_iam_role.WP-Role.name
}