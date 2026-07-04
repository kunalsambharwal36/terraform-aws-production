resource "aws_cloudwatch_dashboard" "this" {

  dashboard_name = "cloudshop-${var.environment}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      ####################################################
      # ALB Request Count
      ####################################################
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Sum"
          region = var.region
          title  = "ALB Request Count"
        }
      },

      ####################################################
      # Target Response Time
      ####################################################
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "TargetResponseTime",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "ALB Response Time"
        }
      },

      ####################################################
      # RDS CPU
      ####################################################
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              var.db_identifier
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "RDS CPU"
        }
      },

      ####################################################
      # Database Connections
      ####################################################
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/RDS",
              "DatabaseConnections",
              "DBInstanceIdentifier",
              var.db_identifier
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "Database Connections"
        }
      },

      ####################################################
      # Healthy Hosts
      ####################################################
      {
        type   = "metric"
        x      = 0
        y      = 12
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HealthyHostCount",
              "TargetGroup",
              var.target_group_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "Healthy Hosts"
        }
      },

      ####################################################
      # UnHealthy Hosts
      ####################################################
      {
        type   = "metric"
        x      = 12
        y      = 12
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "UnHealthyHostCount",
              "TargetGroup",
              var.target_group_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "UnHealthy Hosts"
        }
      },

      ####################################################
      # ALB HTTP 5XX Errors
      ####################################################
      {
        type   = "metric"
        x      = 0
        y      = 18
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_5XX_Count",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Sum"
          region = var.region
          title  = "ALB 5XX Errors"
        }
      },

      ####################################################
      # Application HTTP 5XX Errors
      ####################################################
      {
        type   = "metric"
        x      = 12
        y      = 18
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_Target_5XX_Count",
              "TargetGroup",
              var.target_group_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          period = 60
          stat   = "Sum"
          region = var.region
          title  = "Application 5XX Errors"
        }
      },

      ####################################################
      # ASG Desired Capacity
      ####################################################
      {
        type   = "metric"
        x      = 0
        y      = 24
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/AutoScaling",
              "GroupDesiredCapacity",
              "AutoScalingGroupName",
              var.asg_name
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "Desired Capacity"
        }
      },

      ####################################################
      # ASG In Service Instances
      ####################################################
      {
        type   = "metric"
        x      = 12
        y      = 24
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/AutoScaling",
              "GroupInServiceInstances",
              "AutoScalingGroupName",
              var.asg_name
            ]
          ]

          period = 60
          stat   = "Average"
          region = var.region
          title  = "In Service Instances"
        }
      }

    ]
  })
}