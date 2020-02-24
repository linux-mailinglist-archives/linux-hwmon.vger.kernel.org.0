Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2545C16A705
	for <lists+linux-hwmon@lfdr.de>; Mon, 24 Feb 2020 14:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgBXNNB (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 24 Feb 2020 08:13:01 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49631 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727299AbgBXNNB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 08:13:01 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Feb 2020 15:12:59 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01ODCxTD012666;
        Mon, 24 Feb 2020 15:12:59 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v1 0/2] hwmon: (pmbus) Add support for custom register to data conversion
Date:   Mon, 24 Feb 2020 13:12:55 +0000
Message-Id: <20200224131257.28176-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently there is an assumption that 'input', 'limits' and 'history'
registers use the same conversion format within the sensor class.
However some devices could be configured with different format
for reading 'input' and 'limits' or 'history' registers.

Patch#1 adds reg2data() callback.
Patch#2 utilizes this callback for 'xdpe12284' driver.

Vadim Pasternak (2):
  hwmon: (pmbus/core) Add callback for register to data conversion
  hwmon: (pmbus/xdpe12284) Add custom format for vout limits conversion

 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c |  4 ++++
 drivers/hwmon/pmbus/xdpe12284.c  | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+)

-- 
2.11.0

