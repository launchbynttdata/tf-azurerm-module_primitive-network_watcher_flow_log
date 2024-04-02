package common

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	armNetwork "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v5"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestNetworkWatcherFlowLog(t *testing.T, ctx types.TestContext) {

	subscriptionID := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionID) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID is not set in the environment variables ")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatalf("Unable to get credentials: %e\n", err)
	}

	flowLogsClient, err := armNetwork.NewFlowLogsClient(subscriptionID, cred, nil)
	if err != nil {
		t.Fatalf("Error getting Network Water client: %v", err)
	}

	t.Run("doesNetworkWatcherFlowLogExist", func(t *testing.T) {
		resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
		networkWatcherName := terraform.Output(t, ctx.TerratestTerraformOptions(), "network_watcher_name")
		networkWatcherFlowLogId := terraform.Output(t, ctx.TerratestTerraformOptions(), "id")
		networkWatcherFlowLogName := terraform.Output(t, ctx.TerratestTerraformOptions(), "name")

		networkWatcherFlowLogs, err := flowLogsClient.Get(context.Background(), resourceGroupName, networkWatcherName, networkWatcherFlowLogName, nil)
		if err != nil {
			t.Fatalf("Error getting Network watcher flow logs instance: %v", err)
		}
		if networkWatcherFlowLogs.Name == nil {
			t.Fatalf("Network Network watcher flow logs instance")
		}

		assert.Equal(t, *networkWatcherFlowLogs.ID, networkWatcherFlowLogId)
	})
}
