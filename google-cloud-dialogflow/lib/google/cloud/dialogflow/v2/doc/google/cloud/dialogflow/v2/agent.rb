# Copyright 2019 Google LLC
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
  module Cloud
    module Dialogflow
      module V2
        # Represents a conversational agent.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project of this agent.
        #     Format: `projects/<Project ID>`.
        # @!attribute [rw] display_name
        #   @return [String]
        #     Required. The name of this agent.
        # @!attribute [rw] default_language_code
        #   @return [String]
        #     Required. The default language of the agent as a language tag. See
        #     [Language
        #     Support](https://cloud.google.com/dialogflow/docs/reference/language)
        #     for a list of the currently supported language codes. This field cannot be
        #     set by the `Update` method.
        # @!attribute [rw] supported_language_codes
        #   @return [Array<String>]
        #     Optional. The list of all languages supported by this agent (except for the
        #     `default_language_code`).
        # @!attribute [rw] time_zone
        #   @return [String]
        #     Required. The time zone of this agent from the
        #     [time zone database](https://www.iana.org/time-zones), e.g.,
        #     America/New_York, Europe/Paris.
        # @!attribute [rw] description
        #   @return [String]
        #     Optional. The description of this agent.
        #     The maximum length is 500 characters. If exceeded, the request is rejected.
        # @!attribute [rw] avatar_uri
        #   @return [String]
        #     Optional. The URI of the agent's avatar.
        #     Avatars are used throughout the Dialogflow console and in the self-hosted
        #     [Web
        #     Demo](https://cloud.google.com/dialogflow/docs/integrations/web-demo)
        #     integration.
        # @!attribute [rw] enable_logging
        #   @return [true, false]
        #     Optional. Determines whether this agent should log conversation queries.
        # @!attribute [rw] match_mode
        #   @return [Google::Cloud::Dialogflow::V2::Agent::MatchMode]
        #     Optional. Determines how intents are detected from user queries.
        # @!attribute [rw] classification_threshold
        #   @return [Float]
        #     Optional. To filter out false positive results and still get variety in
        #     matched natural language inputs for your agent, you can tune the machine
        #     learning classification threshold. If the returned score value is less than
        #     the threshold value, then a fallback intent will be triggered or, if there
        #     are no fallback intents defined, no intent will be triggered. The score
        #     values range from 0.0 (completely uncertain) to 1.0 (completely certain).
        #     If set to 0.0, the default of 0.3 is used.
        # @!attribute [rw] api_version
        #   @return [Google::Cloud::Dialogflow::V2::Agent::ApiVersion]
        #     Optional. API version displayed in Dialogflow console. If not specified,
        #     V2 API is assumed. Clients are free to query different service endpoints
        #     for different API versions. However, bots connectors and webhook calls will
        #     follow the specified API version.
        # @!attribute [rw] tier
        #   @return [Google::Cloud::Dialogflow::V2::Agent::Tier]
        #     Optional. The agent tier. If not specified, TIER_STANDARD is assumed.
        class Agent
          # API version for the agent.
          module ApiVersion
            # Not specified.
            API_VERSION_UNSPECIFIED = 0

            # Legacy V1 API.
            API_VERSION_V1 = 1

            # V2 API.
            API_VERSION_V2 = 2

            # V2beta1 API.
            API_VERSION_V2_BETA_1 = 3
          end

          # Match mode determines how intents are detected from user queries.
          module MatchMode
            # Not specified.
            MATCH_MODE_UNSPECIFIED = 0

            # Best for agents with a small number of examples in intents and/or wide
            # use of templates syntax and composite entities.
            MATCH_MODE_HYBRID = 1

            # Can be used for agents with a large number of examples in intents,
            # especially the ones using @sys.any or very large developer entities.
            MATCH_MODE_ML_ONLY = 2
          end

          # Represents the agent tier.
          module Tier
            # Not specified. This value should never be used.
            TIER_UNSPECIFIED = 0

            # Standard tier.
            TIER_STANDARD = 1

            # Enterprise tier (Essentials).
            TIER_ENTERPRISE = 2

            # Enterprise tier (Plus).
            TIER_ENTERPRISE_PLUS = 3
          end
        end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::GetAgent Agents::GetAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to fetch is associated with.
        #     Format: `projects/<Project ID>`.
        class GetAgentRequest; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::SetAgent Agents::SetAgent}.
        # @!attribute [rw] agent
        #   @return [Google::Cloud::Dialogflow::V2::Agent]
        #     Required. The agent to update.
        # @!attribute [rw] update_mask
        #   @return [Google::Protobuf::FieldMask]
        #     Optional. The mask to control which fields get updated.
        class SetAgentRequest; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::DeleteAgent Agents::DeleteAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to delete is associated with.
        #     Format: `projects/<Project ID>`.
        class DeleteAgentRequest; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::SearchAgents Agents::SearchAgents}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project to list agents from.
        #     Format: `projects/<Project ID or '-'>`.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     Optional. The maximum number of items to return in a single page. By
        #     default 100 and at most 1000.
        # @!attribute [rw] page_token
        #   @return [String]
        #     The next_page_token value returned from a previous list request.
        class SearchAgentsRequest; end

        # The response message for {Google::Cloud::Dialogflow::V2::Agents::SearchAgents Agents::SearchAgents}.
        # @!attribute [rw] agents
        #   @return [Array<Google::Cloud::Dialogflow::V2::Agent>]
        #     The list of agents. There will be a maximum number of items returned based
        #     on the page_size field in the request.
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     Token to retrieve the next page of results, or empty if there are no
        #     more results in the list.
        class SearchAgentsResponse; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::TrainAgent Agents::TrainAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to train is associated with.
        #     Format: `projects/<Project ID>`.
        class TrainAgentRequest; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::ExportAgent Agents::ExportAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to export is associated with.
        #     Format: `projects/<Project ID>`.
        # @!attribute [rw] agent_uri
        #   @return [String]
        #     Required. The [Google Cloud Storage](https://cloud.google.com/storage/docs/)
        #     URI to export the agent to.
        #     The format of this URI must be `gs://<bucket-name>/<object-name>`.
        #     If left unspecified, the serialized agent is returned inline.
        class ExportAgentRequest; end

        # The response message for {Google::Cloud::Dialogflow::V2::Agents::ExportAgent Agents::ExportAgent}.
        # @!attribute [rw] agent_uri
        #   @return [String]
        #     The URI to a file containing the exported agent. This field is populated
        #     only if `agent_uri` is specified in `ExportAgentRequest`.
        # @!attribute [rw] agent_content
        #   @return [String]
        #     The exported agent.
        #
        #     Example for how to export an agent to a zip file via a command line:
        #     <pre>curl \
        #       'https://dialogflow.googleapis.com/v2/projects/&lt;project_id&gt;/agent:export'\
        #       -X POST \
        #       -H 'Authorization: Bearer' \
        #       $(gcloud auth application-default print-access-token) \
        #       -H 'Accept: application/json'
        #       --compressed \
        #       | grep agentContent | sed -e 's/.*"agentContent": "\([^"]*\)".*/\1/' \
        #       | base64 --decode > &lt;agent zip file&gt;</pre>
        class ExportAgentResponse; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::ImportAgent Agents::ImportAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to import is associated with.
        #     Format: `projects/<Project ID>`.
        # @!attribute [rw] agent_uri
        #   @return [String]
        #     The URI to a Google Cloud Storage file containing the agent to import.
        #     Note: The URI must start with "gs://".
        # @!attribute [rw] agent_content
        #   @return [String]
        #     The agent to import.
        #
        #     Example for how to import an agent via the command line:
        #     <pre>curl \
        #       'https://dialogflow.googleapis.com/v2/projects/&lt;project_id&gt;/agent:import'\
        #        -X POST \
        #        -H 'Authorization: Bearer'\
        #        $(gcloud auth application-default print-access-token) \
        #        -H 'Accept: application/json' \
        #        -H 'Content-Type: application/json' \
        #        --data-binary "{
        #           'agentContent': '$(cat &lt;agent zip file&gt; | base64 -w 0)'
        #        }"</pre>
        class ImportAgentRequest; end

        # The request message for {Google::Cloud::Dialogflow::V2::Agents::RestoreAgent Agents::RestoreAgent}.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project that the agent to restore is associated with.
        #     Format: `projects/<Project ID>`.
        # @!attribute [rw] agent_uri
        #   @return [String]
        #     The URI to a Google Cloud Storage file containing the agent to restore.
        #     Note: The URI must start with "gs://".
        # @!attribute [rw] agent_content
        #   @return [String]
        #     The agent to restore.
        #
        #     Example for how to restore an agent via the command line:
        #     <pre>curl \
        #       'https://dialogflow.googleapis.com/v2/projects/&lt;project_id&gt;/agent:restore'\
        #        -X POST \
        #        -H 'Authorization: Bearer' \
        #        $(gcloud auth application-default print-access-token) \
        #        -H 'Accept: application/json' \
        #        -H 'Content-Type: application/json' \
        #        --data-binary "{
        #            'agentContent': '$(cat &lt;agent zip file&gt; | base64 -w 0)'
        #        }"</pre>
        class RestoreAgentRequest; end
      end
    end
  end
end