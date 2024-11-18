-- CreateTable
CREATE TABLE "nodes" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "long_name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,
    "hardware_model" INTEGER NOT NULL,
    "role" INTEGER NOT NULL,
    "is_licensed" BOOLEAN,
    "firmware_version" TEXT,
    "region" INTEGER,
    "modem_preset" INTEGER,
    "has_default_channel" BOOLEAN,
    "position_precision" INTEGER,
    "num_online_local_nodes" INTEGER,
    "latitude" INTEGER,
    "longitude" INTEGER,
    "altitude" INTEGER,
    "position_updated_at" TIMESTAMP(3),
    "battery_level" INTEGER,
    "voltage" DECIMAL(65,30),
    "channel_utilization" DECIMAL(65,30),
    "air_util_tx" DECIMAL(65,30),
    "uptime_seconds" BIGINT,
    "temperature" DECIMAL(65,30),
    "relative_humidity" DECIMAL(65,30),
    "barometric_pressure" DECIMAL(65,30),
    "neighbour_broadcast_interval_secs" INTEGER,
    "neighbours" JSONB,
    "neighbours_updated_at" TIMESTAMP(3),
    "mqtt_connection_state_updated_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "nodes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "map_reports" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "long_name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,
    "role" INTEGER NOT NULL,
    "hardware_model" INTEGER NOT NULL,
    "firmware_version" TEXT NOT NULL,
    "region" INTEGER,
    "modem_preset" INTEGER,
    "has_default_channel" BOOLEAN,
    "latitude" INTEGER,
    "longitude" INTEGER,
    "altitude" INTEGER,
    "position_precision" INTEGER,
    "num_online_local_nodes" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "map_reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "neighbour_infos" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "node_broadcast_interval_secs" INTEGER NOT NULL,
    "neighbours" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "neighbour_infos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "device_metrics" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "battery_level" INTEGER,
    "voltage" DECIMAL(65,30),
    "channel_utilization" DECIMAL(65,30),
    "air_util_tx" DECIMAL(65,30),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "device_metrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "environment_metrics" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "packet_id" BIGINT,
    "temperature" DECIMAL(65,30),
    "relative_humidity" DECIMAL(65,30),
    "barometric_pressure" DECIMAL(65,30),
    "gas_resistance" DECIMAL(65,30),
    "voltage" DECIMAL(65,30),
    "current" DECIMAL(65,30),
    "iaq" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "environment_metrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "power_metrics" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "packet_id" BIGINT,
    "ch1_voltage" DECIMAL(65,30),
    "ch1_current" DECIMAL(65,30),
    "ch2_voltage" DECIMAL(65,30),
    "ch2_current" DECIMAL(65,30),
    "ch3_voltage" DECIMAL(65,30),
    "ch3_current" DECIMAL(65,30),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "power_metrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "positions" (
    "id" BIGSERIAL NOT NULL,
    "node_id" BIGINT NOT NULL,
    "to" BIGINT NOT NULL,
    "from" BIGINT NOT NULL,
    "channel" INTEGER,
    "packet_id" BIGINT,
    "channel_id" TEXT,
    "gateway_id" BIGINT,
    "latitude" INTEGER,
    "longitude" INTEGER,
    "altitude" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "service_envelopes" (
    "id" BIGSERIAL NOT NULL,
    "mqtt_topic" TEXT NOT NULL,
    "channel_id" TEXT NOT NULL,
    "gateway_id" BIGINT,
    "to" BIGINT NOT NULL,
    "from" BIGINT NOT NULL,
    "protobuf" BYTEA NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "service_envelopes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "text_messages" (
    "id" BIGSERIAL NOT NULL,
    "to" BIGINT NOT NULL,
    "from" BIGINT NOT NULL,
    "channel" INTEGER NOT NULL,
    "packet_id" BIGINT NOT NULL,
    "channel_id" TEXT NOT NULL,
    "gateway_id" BIGINT,
    "text" TEXT NOT NULL,
    "rx_time" BIGINT,
    "rx_snr" DECIMAL(65,30),
    "rx_rssi" INTEGER,
    "hop_limit" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "text_messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "traceroutes" (
    "id" BIGSERIAL NOT NULL,
    "to" BIGINT NOT NULL,
    "from" BIGINT NOT NULL,
    "want_response" BOOLEAN NOT NULL,
    "route" JSONB NOT NULL,
    "snr_towards" JSONB,
    "route_back" JSONB,
    "snr_back" JSONB,
    "channel" INTEGER,
    "packet_id" BIGINT,
    "channel_id" TEXT,
    "gateway_id" BIGINT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "traceroutes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "waypoints" (
    "id" BIGSERIAL NOT NULL,
    "from" BIGINT NOT NULL,
    "to" BIGINT NOT NULL,
    "waypoint_id" BIGINT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL,
    "expire" BIGINT,
    "locked_to" BIGINT,
    "name" TEXT,
    "description" TEXT,
    "icon" INTEGER,
    "channel" INTEGER NOT NULL,
    "packet_id" BIGINT NOT NULL,
    "channel_id" TEXT NOT NULL,
    "gateway_id" BIGINT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "waypoints_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "nodes_node_id_key" ON "nodes"("node_id");

-- CreateIndex
CREATE INDEX "nodes_created_at_idx" ON "nodes"("created_at");

-- CreateIndex
CREATE INDEX "nodes_updated_at_idx" ON "nodes"("updated_at");

-- CreateIndex
CREATE INDEX "nodes_node_id_idx" ON "nodes"("node_id");

-- CreateIndex
CREATE INDEX "map_reports_created_at_idx" ON "map_reports"("created_at");

-- CreateIndex
CREATE INDEX "map_reports_updated_at_idx" ON "map_reports"("updated_at");

-- CreateIndex
CREATE INDEX "map_reports_node_id_idx" ON "map_reports"("node_id");

-- CreateIndex
CREATE INDEX "neighbour_infos_created_at_idx" ON "neighbour_infos"("created_at");

-- CreateIndex
CREATE INDEX "neighbour_infos_updated_at_idx" ON "neighbour_infos"("updated_at");

-- CreateIndex
CREATE INDEX "neighbour_infos_node_id_idx" ON "neighbour_infos"("node_id");

-- CreateIndex
CREATE INDEX "device_metrics_created_at_idx" ON "device_metrics"("created_at");

-- CreateIndex
CREATE INDEX "device_metrics_updated_at_idx" ON "device_metrics"("updated_at");

-- CreateIndex
CREATE INDEX "device_metrics_node_id_idx" ON "device_metrics"("node_id");

-- CreateIndex
CREATE INDEX "environment_metrics_created_at_idx" ON "environment_metrics"("created_at");

-- CreateIndex
CREATE INDEX "environment_metrics_updated_at_idx" ON "environment_metrics"("updated_at");

-- CreateIndex
CREATE INDEX "environment_metrics_node_id_idx" ON "environment_metrics"("node_id");

-- CreateIndex
CREATE INDEX "environment_metrics_packet_id_idx" ON "environment_metrics"("packet_id");

-- CreateIndex
CREATE INDEX "power_metrics_created_at_idx" ON "power_metrics"("created_at");

-- CreateIndex
CREATE INDEX "power_metrics_updated_at_idx" ON "power_metrics"("updated_at");

-- CreateIndex
CREATE INDEX "power_metrics_node_id_idx" ON "power_metrics"("node_id");

-- CreateIndex
CREATE INDEX "power_metrics_packet_id_idx" ON "power_metrics"("packet_id");

-- CreateIndex
CREATE INDEX "positions_created_at_idx" ON "positions"("created_at");

-- CreateIndex
CREATE INDEX "positions_updated_at_idx" ON "positions"("updated_at");

-- CreateIndex
CREATE INDEX "positions_node_id_idx" ON "positions"("node_id");

-- CreateIndex
CREATE INDEX "positions_packet_id_idx" ON "positions"("packet_id");

-- CreateIndex
CREATE INDEX "service_envelopes_created_at_idx" ON "service_envelopes"("created_at");

-- CreateIndex
CREATE INDEX "service_envelopes_updated_at_idx" ON "service_envelopes"("updated_at");

-- CreateIndex
CREATE INDEX "service_envelopes_gateway_id_idx" ON "service_envelopes"("gateway_id");

-- CreateIndex
CREATE INDEX "text_messages_created_at_idx" ON "text_messages"("created_at");

-- CreateIndex
CREATE INDEX "text_messages_updated_at_idx" ON "text_messages"("updated_at");

-- CreateIndex
CREATE INDEX "text_messages_to_idx" ON "text_messages"("to");

-- CreateIndex
CREATE INDEX "text_messages_from_idx" ON "text_messages"("from");

-- CreateIndex
CREATE INDEX "text_messages_packet_id_idx" ON "text_messages"("packet_id");

-- CreateIndex
CREATE INDEX "text_messages_gateway_id_idx" ON "text_messages"("gateway_id");

-- CreateIndex
CREATE INDEX "traceroutes_created_at_idx" ON "traceroutes"("created_at");

-- CreateIndex
CREATE INDEX "traceroutes_updated_at_idx" ON "traceroutes"("updated_at");

-- CreateIndex
CREATE INDEX "traceroutes_to_idx" ON "traceroutes"("to");

-- CreateIndex
CREATE INDEX "traceroutes_from_idx" ON "traceroutes"("from");

-- CreateIndex
CREATE INDEX "waypoints_created_at_idx" ON "waypoints"("created_at");

-- CreateIndex
CREATE INDEX "waypoints_updated_at_idx" ON "waypoints"("updated_at");

-- CreateIndex
CREATE INDEX "waypoints_to_idx" ON "waypoints"("to");

-- CreateIndex
CREATE INDEX "waypoints_from_idx" ON "waypoints"("from");

-- CreateIndex
CREATE INDEX "waypoints_waypoint_id_idx" ON "waypoints"("waypoint_id");

-- CreateIndex
CREATE INDEX "waypoints_packet_id_idx" ON "waypoints"("packet_id");

-- CreateIndex
CREATE INDEX "waypoints_gateway_id_idx" ON "waypoints"("gateway_id");
