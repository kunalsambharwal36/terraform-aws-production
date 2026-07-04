resource "aws_cloudwatch_dashboard" "this" {

  dashboard_name = "cloudshop-${var.environment}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      ####################################################
      # ALB Request Count
      ####################################################

      {
        "type" : "metric",
        "x" : 0,
        "y" : 0,
        "width" : 12,
        "height" : 6,

        "properties" : {
          "metrics" : [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              var.alb_name
            ]
          ],

          "period" : 300,
          "stat" : "Sum",
          "region" : var.region,
          "title" : "ALB Request Count"
        }
      },

      ####################################################
      # Target Response Time
      ####################################################

      {
        "type" : "metric",
        "x" : 12,
        "y" : 0,
        "width" : 12,
        "height" : 6,

        "properties" : {
          "metrics" : [
            [
              "AWS/ApplicationELB",
              "TargetResponseTime",
              "LoadBalancer",
              var.alb_name
            ]
          ],

          "period" : 300,
          "stat" : "Average",
          "region" : var.region,
          "title" : "ALB Response Time"
        }
      },

      ####################################################
      # RDS CPU
      ####################################################

      {
        "type" : "metric",
        "x" : 0,
        "y" : 6,
        "width" : 12,
        "height" : 6,

        "properties" : {

          "metrics" : [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              var.db_identifier
            ]
          ],

          "period" : 300,
          "stat" : "Average",
          "region" : var.region,
          "title" : "RDS CPU"
        }
      },

      ####################################################
      # Database Connections
      ####################################################

      {
        "type" : "metric",
        "x" : 12,
        "y" : 6,
        "width" : 12,
        "height" : 6,

        "properties" : {

          "metrics" : [
            [
              "AWS/RDS",
              "DatabaseConnections",
              "DBInstanceIdentifier",
              var.db_identifier
            ]
          ],

          "period" : 300,
          "stat" : "Average",
          "region" : var.region,
          "title" : "Database Connections"
        }
      }

    ]
  })
}