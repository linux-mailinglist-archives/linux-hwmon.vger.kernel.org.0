Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96821344A8
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jan 2020 15:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgAHOLr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 8 Jan 2020 09:11:47 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50756 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728755AbgAHOLr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jan 2020 09:11:47 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 8 Jan 2020 16:11:42 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 008EBgZF030061;
        Wed, 8 Jan 2020 16:11:42 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 0/5] hwmon: (pmbus) Add support for vid mode calculation per page bases
Date:   Wed,  8 Jan 2020 14:11:35 +0000
Message-Id: <20200108141140.2175-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently "pmbus" infrastructure does not build for support reading
"vout" in "vid" mode, for cases when device is configured with the
different modes per page bases.
However some devices could be configured in such way.
The patchset includes:
Patch#1 allows selection mode per pmbus page bases, by extending
	"vrm_version" field to per page array and modify the drivers
	using this field.
Patch#2 introduces support for "vrm" Intel specification mode "IMVP9"
	and AMD specification mode "6.25mV".
Patch#3 extends "tps53679" driver with support of the additional
	device TPS53688.
Patch#4 introduces new driver for Infineon Multi-phase Digital VR
	Controller Sierra controllers XDPE12250, XDPE12254, XDPE12283,
	XDPE12284, XDPE12286.
Patch#5 extends binding documentation for trivial devices.

Vadim Pasternak (5):
  hwmon: (pmbus/core) Add support for vid mode detection per page bases
  hwmon: (pmbus/core) Add support for Intel IMVP9 and AMD 6.25mV modes
  hwmon: (pmbus/tps53679) Extend device list supported by driver
  hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family
    controllers
  dt-bindings: Add TI and Infineon VR Controllers as trivial devices

 .../devicetree/bindings/trivial-devices.yaml       |  14 +++
 drivers/hwmon/pmbus/Kconfig                        |  13 ++-
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max20751.c                     |   2 +-
 drivers/hwmon/pmbus/pmbus.c                        |   5 +-
 drivers/hwmon/pmbus/pmbus.h                        |   4 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  10 +-
 drivers/hwmon/pmbus/pxe1610.c                      |  44 ++++----
 drivers/hwmon/pmbus/tps53679.c                     |  46 ++++----
 drivers/hwmon/pmbus/xdpe12284.c                    | 121 +++++++++++++++++++++
 10 files changed, 211 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/xdpe12284.c

-- 
2.11.0

