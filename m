Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43EB4139453
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jan 2020 16:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgAMPIu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 13 Jan 2020 10:08:50 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58633 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726399AbgAMPIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 10:08:50 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 13 Jan 2020 17:08:43 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 00DF8hqZ006851;
        Mon, 13 Jan 2020 17:08:43 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 0/6] hwmon: (pmbus) Add support for vid mode calculation per page bases
Date:   Mon, 13 Jan 2020 15:08:35 +0000
Message-Id: <20200113150841.17670-1-vadimp@mellanox.com>
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
	Controller Sierra controllers XDPE12254, XDPE12284.
Patch#5 extends binding documentation for trivial devices.
Patch#6 adds documentation.

Vadim Pasternak (6):
  hwmon: (pmbus/core) Add support for vid mode detection per page bases
  hwmon: (pmbus/core) Add support for Intel IMVP9 and AMD 6.25mV modes
  hwmon: (pmbus/tps53679) Extend device list supported by driver
  hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family
    controllers
  dt-bindings: Add TI and Infineon VR Controllers as trivial devices
  docs: hwmon: Include 'xdpe12284.rst' into docs

 .../devicetree/bindings/trivial-devices.yaml       |   8 ++
 Documentation/hwmon/xdpe12284.rst                  | 101 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  13 ++-
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max20751.c                     |   2 +-
 drivers/hwmon/pmbus/pmbus.c                        |   5 +-
 drivers/hwmon/pmbus/pmbus.h                        |   4 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  10 +-
 drivers/hwmon/pmbus/pxe1610.c                      |  44 ++++----
 drivers/hwmon/pmbus/tps53679.c                     |  46 ++++----
 drivers/hwmon/pmbus/xdpe12284.c                    | 116 +++++++++++++++++++++
 11 files changed, 301 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/hwmon/xdpe12284.rst
 create mode 100644 drivers/hwmon/pmbus/xdpe12284.c

-- 
2.11.0

