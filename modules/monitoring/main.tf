resource "aws_cloudwatch_dashboard" "cloudshop" {

  dashboard_name = "cloudshop-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type = "metric"

        x = 0
        y = 0

        width  = 12
        height = 6

        properties = {

          title = "EC2 CPU Utilization"

          view = "timeSeries"

          stacked = false

          region = "us-east-1"

          metrics = [

            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              "i-0e4b25d2df715e307"
            ],

            [
              ".",
              ".",
              ".",
              "i-0810cc49cc306350b"
            ]

          ]
        }
      },

      {
        type = "metric"

        x = 12
        y = 0

        width  = 12
        height = 6

        properties = {

          title = "RDS CPU"

          region = "us-east-1"

          view = "timeSeries"

          metrics = [

            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              "cloudshop-db"
            ]

          ]
        }
      }

    ]

  })
}