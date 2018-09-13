# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Monitoring
    module V3
      # A description of the conditions under which some aspect of your system is
      # considered to be "unhealthy" and the ways to notify people or services about
      # this state. For an overview of alert policies, see
      # [Introduction to Alerting](https://cloud.google.com/monitoring/alerts/).
      # @!attribute [rw] name
      #   @return [String]
      #     Required if the policy exists. The resource name for this policy. The
      #     syntax is:
      #
      #         projects/[PROJECT_ID]/alertPolicies/[ALERT_POLICY_ID]
      #
      #     `[ALERT_POLICY_ID]` is assigned by Stackdriver Monitoring when the policy
      #     is created.  When calling the
      #     {Google::Monitoring::V3::AlertPolicyService::CreateAlertPolicy alertPolicies::create}
      #     method, do not include the `name` field in the alerting policy passed as
      #     part of the request.
      # @!attribute [rw] display_name
      #   @return [String]
      #     A short name or phrase used to identify the policy in dashboards,
      #     notifications, and incidents. To avoid confusion, don't use the same
      #     display name for multiple policies in the same project. The name is
      #     limited to 512 Unicode characters.
      # @!attribute [rw] documentation
      #   @return [Google::Monitoring::V3::AlertPolicy::Documentation]
      #     Documentation that is included with notifications and incidents related to
      #     this policy. Best practice is for the documentation to include information
      #     to help responders understand, mitigate, escalate, and correct the
      #     underlying problems detected by the alerting policy. Notification channels
      #     that have limited capacity might not show this documentation.
      # @!attribute [rw] user_labels
      #   @return [Hash{String => String}]
      #     User-supplied key/value data to be used for organizing and
      #     identifying the `AlertPolicy` objects.
      #
      #     The field can contain up to 64 entries. Each key and value is limited to
      #     63 Unicode characters or 128 bytes, whichever is smaller. Labels and
      #     values can contain only lowercase letters, numerals, underscores, and
      #     dashes. Keys must begin with a letter.
      # @!attribute [rw] conditions
      #   @return [Array<Google::Monitoring::V3::AlertPolicy::Condition>]
      #     A list of conditions for the policy. The conditions are combined by AND or
      #     OR according to the `combiner` field. If the combined conditions evaluate
      #     to true, then an incident is created. A policy can have from one to six
      #     conditions.
      # @!attribute [rw] combiner
      #   @return [Google::Monitoring::V3::AlertPolicy::ConditionCombinerType]
      #     How to combine the results of multiple conditions
      #     to determine if an incident should be opened.
      # @!attribute [rw] enabled
      #   @return [Google::Protobuf::BoolValue]
      #     Whether or not the policy is enabled. On write, the default interpretation
      #     if unset is that the policy is enabled. On read, clients should not make
      #     any assumption about the state if it has not been populated. The
      #     field should always be populated on List and Get operations, unless
      #     a field projection has been specified that strips it out.
      # @!attribute [rw] notification_channels
      #   @return [Array<String>]
      #     Identifies the notification channels to which notifications should be sent
      #     when incidents are opened or closed or when new violations occur on
      #     an already opened incident. Each element of this array corresponds to
      #     the `name` field in each of the
      #     {Google::Monitoring::V3::NotificationChannel `NotificationChannel`}
      #     objects that are returned from the [`ListNotificationChannels`]
      #     [google.monitoring.v3.NotificationChannelService.ListNotificationChannels]
      #     method. The syntax of the entries in this field is:
      #
      #         projects/[PROJECT_ID]/notificationChannels/[CHANNEL_ID]
      # @!attribute [rw] creation_record
      #   @return [Google::Monitoring::V3::MutationRecord]
      #     A read-only record of the creation of the alerting policy. If provided
      #     in a call to create or update, this field will be ignored.
      # @!attribute [rw] mutation_record
      #   @return [Google::Monitoring::V3::MutationRecord]
      #     A read-only record of the most recent change to the alerting policy. If
      #     provided in a call to create or update, this field will be ignored.
      class AlertPolicy
        # A content string and a MIME type that describes the content string's
        # format.
        # @!attribute [rw] content
        #   @return [String]
        #     The text of the documentation, interpreted according to `mime_type`.
        #     The content may not exceed 8,192 Unicode characters and may not exceed
        #     more than 10,240 bytes when encoded in UTF-8 format, whichever is
        #     smaller.
        # @!attribute [rw] mime_type
        #   @return [String]
        #     The format of the `content` field. Presently, only the value
        #     `"text/markdown"` is supported. See
        #     [Markdown](https://en.wikipedia.org/wiki/Markdown) for more information.
        class Documentation; end

        # A condition is a true/false test that determines when an alerting policy
        # should open an incident. If a condition evaluates to true, it signifies
        # that something is wrong.
        # @!attribute [rw] name
        #   @return [String]
        #     Required if the condition exists. The unique resource name for this
        #     condition. Its syntax is:
        #
        #         projects/[PROJECT_ID]/alertPolicies/[POLICY_ID]/conditions/[CONDITION_ID]
        #
        #     `[CONDITION_ID]` is assigned by Stackdriver Monitoring when the
        #     condition is created as part of a new or updated alerting policy.
        #
        #     When calling the
        #     {Google::Monitoring::V3::AlertPolicyService::CreateAlertPolicy alertPolicies::create}
        #     method, do not include the `name` field in the conditions of the
        #     requested alerting policy. Stackdriver Monitoring creates the
        #     condition identifiers and includes them in the new policy.
        #
        #     When calling the
        #     {Google::Monitoring::V3::AlertPolicyService::UpdateAlertPolicy alertPolicies::update}
        #     method to update a policy, including a condition `name` causes the
        #     existing condition to be updated. Conditions without names are added to
        #     the updated policy. Existing conditions are deleted if they are not
        #     updated.
        #
        #     Best practice is to preserve `[CONDITION_ID]` if you make only small
        #     changes, such as those to condition thresholds, durations, or trigger
        #     values.  Otherwise, treat the change as a new condition and let the
        #     existing condition be deleted.
        # @!attribute [rw] display_name
        #   @return [String]
        #     A short name or phrase used to identify the condition in dashboards,
        #     notifications, and incidents. To avoid confusion, don't use the same
        #     display name for multiple conditions in the same policy.
        # @!attribute [rw] condition_threshold
        #   @return [Google::Monitoring::V3::AlertPolicy::Condition::MetricThreshold]
        #     A condition that compares a time series against a threshold.
        # @!attribute [rw] condition_absent
        #   @return [Google::Monitoring::V3::AlertPolicy::Condition::MetricAbsence]
        #     A condition that checks that a time series continues to
        #     receive new data points.
        class Condition
          # Specifies how many time series must fail a predicate to trigger a
          # condition. If not specified, then a `{count: 1}` trigger is used.
          # @!attribute [rw] count
          #   @return [Integer]
          #     The absolute number of time series that must fail
          #     the predicate for the condition to be triggered.
          # @!attribute [rw] percent
          #   @return [Float]
          #     The percentage of time series that must fail the
          #     predicate for the condition to be triggered.
          class Trigger; end

          # A condition type that compares a collection of time series
          # against a threshold.
          # @!attribute [rw] filter
          #   @return [String]
          #     A [filter](https://cloud.google.com/monitoring/api/v3/filters) that
          #     identifies which time series should be compared with the threshold.
          #
          #     The filter is similar to the one that is specified in the
          #     [`MetricService.ListTimeSeries`
          #     request](/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list) (that
          #     call is useful to verify the time series that will be retrieved /
          #     processed) and must specify the metric type and optionally may contain
          #     restrictions on resource type, resource labels, and metric labels.
          #     This field may not exceed 2048 Unicode characters in length.
          # @!attribute [rw] aggregations
          #   @return [Array<Google::Monitoring::V3::Aggregation>]
          #     Specifies the alignment of data points in individual time series as
          #     well as how to combine the retrieved time series together (such as
          #     when aggregating multiple streams on each resource to a single
          #     stream for each resource or when aggregating streams across all
          #     members of a group of resrouces). Multiple aggregations
          #     are applied in the order specified.
          #
          #     This field is similar to the one in the
          #     [`MetricService.ListTimeSeries` request](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list).
          #     It is advisable to use the `ListTimeSeries` method when debugging this field.
          # @!attribute [rw] denominator_filter
          #   @return [String]
          #     A [filter](https://cloud.google.com/monitoring/api/v3/filters) that identifies a time
          #     series that should be used as the denominator of a ratio that will be
          #     compared with the threshold. If a `denominator_filter` is specified,
          #     the time series specified by the `filter` field will be used as the
          #     numerator.
          #
          #     The filter is similar to the one that is specified in the
          #     [`MetricService.ListTimeSeries`
          #     request](/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list) (that
          #     call is useful to verify the time series that will be retrieved /
          #     processed) and must specify the metric type and optionally may contain
          #     restrictions on resource type, resource labels, and metric labels.
          #     This field may not exceed 2048 Unicode characters in length.
          # @!attribute [rw] denominator_aggregations
          #   @return [Array<Google::Monitoring::V3::Aggregation>]
          #     Specifies the alignment of data points in individual time series
          #     selected by `denominatorFilter` as
          #     well as how to combine the retrieved time series together (such as
          #     when aggregating multiple streams on each resource to a single
          #     stream for each resource or when aggregating streams across all
          #     members of a group of resources).
          #
          #     When computing ratios, the `aggregations` and
          #     `denominator_aggregations` fields must use the same alignment period
          #     and produce time series that have the same periodicity and labels.
          #
          #     This field is similar to the one in the
          #     [`MetricService.ListTimeSeries`
          #     request](/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list). It
          #     is advisable to use the `ListTimeSeries` method when debugging this
          #     field.
          # @!attribute [rw] comparison
          #   @return [Google::Monitoring::V3::ComparisonType]
          #     The comparison to apply between the time series (indicated by `filter`
          #     and `aggregation`) and the threshold (indicated by `threshold_value`).
          #     The comparison is applied on each time series, with the time series
          #     on the left-hand side and the threshold on the right-hand side.
          #
          #     Only `COMPARISON_LT` and `COMPARISON_GT` are supported currently.
          # @!attribute [rw] threshold_value
          #   @return [Float]
          #     A value against which to compare the time series.
          # @!attribute [rw] duration
          #   @return [Google::Protobuf::Duration]
          #     The amount of time that a time series must violate the
          #     threshold to be considered failing. Currently, only values
          #     that are a multiple of a minute--e.g., 0, 60, 120, or 300
          #     seconds--are supported. If an invalid value is given, an
          #     error will be returned. When choosing a duration, it is useful to
          #     keep in mind the frequency of the underlying time series data
          #     (which may also be affected by any alignments specified in the
          #     `aggregations` field); a good duration is long enough so that a single
          #     outlier does not generate spurious alerts, but short enough that
          #     unhealthy states are detected and alerted on quickly.
          # @!attribute [rw] trigger
          #   @return [Google::Monitoring::V3::AlertPolicy::Condition::Trigger]
          #     The number/percent of time series for which the comparison must hold
          #     in order for the condition to trigger. If unspecified, then the
          #     condition will trigger if the comparison is true for any of the
          #     time series that have been identified by `filter` and `aggregations`,
          #     or by the ratio, if `denominator_filter` and `denominator_aggregations`
          #     are specified.
          class MetricThreshold; end

          # A condition type that checks that monitored resources
          # are reporting data. The configuration defines a metric and
          # a set of monitored resources. The predicate is considered in violation
          # when a time series for the specified metric of a monitored
          # resource does not include any data in the specified `duration`.
          # @!attribute [rw] filter
          #   @return [String]
          #     A [filter](https://cloud.google.com/monitoring/api/v3/filters) that
          #     identifies which time series should be compared with the threshold.
          #
          #     The filter is similar to the one that is specified in the
          #     [`MetricService.ListTimeSeries`
          #     request](/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list) (that
          #     call is useful to verify the time series that will be retrieved /
          #     processed) and must specify the metric type and optionally may contain
          #     restrictions on resource type, resource labels, and metric labels.
          #     This field may not exceed 2048 Unicode characters in length.
          # @!attribute [rw] aggregations
          #   @return [Array<Google::Monitoring::V3::Aggregation>]
          #     Specifies the alignment of data points in individual time series as
          #     well as how to combine the retrieved time series together (such as
          #     when aggregating multiple streams on each resource to a single
          #     stream for each resource or when aggregating streams across all
          #     members of a group of resrouces). Multiple aggregations
          #     are applied in the order specified.
          #
          #     This field is similar to the
          #     one in the [`MetricService.ListTimeSeries` request](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list).
          #     It is advisable to use the `ListTimeSeries` method when debugging this field.
          # @!attribute [rw] duration
          #   @return [Google::Protobuf::Duration]
          #     The amount of time that a time series must fail to report new
          #     data to be considered failing. Currently, only values that
          #     are a multiple of a minute--e.g.  60, 120, or 300
          #     seconds--are supported. If an invalid value is given, an
          #     error will be returned. The `Duration.nanos` field is
          #     ignored.
          # @!attribute [rw] trigger
          #   @return [Google::Monitoring::V3::AlertPolicy::Condition::Trigger]
          #     The number/percent of time series for which the comparison must hold
          #     in order for the condition to trigger. If unspecified, then the
          #     condition will trigger if the comparison is true for any of the
          #     time series that have been identified by `filter` and `aggregations`.
          class MetricAbsence; end
        end

        # Operators for combining conditions.
        module ConditionCombinerType
          # An unspecified combiner.
          COMBINE_UNSPECIFIED = 0

          # Combine conditions using the logical `AND` operator. An
          # incident is created only if all conditions are met
          # simultaneously. This combiner is satisfied if all conditions are
          # met, even if they are met on completely different resources.
          AND = 1

          # Combine conditions using the logical `OR` operator. An incident
          # is created if any of the listed conditions is met.
          OR = 2

          # Combine conditions using logical `AND` operator, but unlike the regular
          # `AND` option, an incident is created only if all conditions are met
          # simultaneously on at least one resource.
          AND_WITH_MATCHING_RESOURCE = 3
        end
      end
    end
  end
end