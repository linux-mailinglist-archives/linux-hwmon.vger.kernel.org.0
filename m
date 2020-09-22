Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623E82749C2
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Sep 2020 22:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVUFJ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 22 Sep 2020 16:05:09 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37813 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726567AbgIVUFJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Sep 2020 16:05:09 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Sep 2020 23:05:07 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08MK560i012180;
        Tue, 22 Sep 2020 23:05:06 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 0/2] hwmon: (pmbus) Add support for MPS mp2975 controller
Date:   Tue, 22 Sep 2020 23:05:02 +0300
Message-Id: <20200922200504.15375-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The patchset includes:
Patch #1 - introduction of the driver for mp2975 device,
	   documentation for mp2975 device driver.
Patch #2 - extending of binding documentation for trivial devices.

Vadim Pasternak (2):
  hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller
  dt-bindings: Add MP2975 voltage regulator device

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/mp2975.rst                     | 116 +++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2975.c                       | 812 +++++++++++++++++++++
 5 files changed, 940 insertions(+)
 create mode 100644 Documentation/hwmon/mp2975.rst
 create mode 100644 drivers/hwmon/pmbus/mp2975.c

-- 
2.11.0

