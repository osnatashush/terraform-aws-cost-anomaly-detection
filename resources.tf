resource "aws_ce_anomaly_monitor" "anomaly_monitor" {
  count             = var.create_anomaly_monitor ? 1 : 0
  name              = "AWSServiceMonitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}

resource "aws_ce_anomaly_subscription" "realtime_subscription" {
  name      = "RealtimeAnomalySubscription"
  frequency = "IMMEDIATE"

  threshold_expression {
    or {
      dimension {
        key           = "ANOMALY_TOTAL_IMPACT_PERCENTAGE"
        values        = [var.raise_amount_percent]
        match_options = ["GREATER_THAN_OR_EQUAL"]
      }
    }
    or {
      dimension {
        key           = "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
        values        = [var.raise_amount_absolute]
        match_options = ["GREATER_THAN_OR_EQUAL"]
      }
    }
  }

  monitor_arn_list = var.create_anomaly_monitor ? [aws_ce_anomaly_monitor.anomaly_monitor[0].arn] : [var.anomaly_monitor_arn]

  subscriber {
    type    = "SNS"
    address = var.sns_topic
  }
}
