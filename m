Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFE521ACF7
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2020 04:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgGJCPk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 9 Jul 2020 22:15:40 -0400
Received: from server-x.ipv4.hkg02.ds.network ([27.111.83.178]:50802 "EHLO
        mail.gtsys.com.hk" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgGJCPk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Jul 2020 22:15:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id CFFD020160C8;
        Fri, 10 Jul 2020 10:15:37 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j_CSdWE8rvp2; Fri, 10 Jul 2020 10:15:37 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id ADCC020160B5;
        Fri, 10 Jul 2020 10:15:37 +0800 (HKT)
Received: from armhf2.gtsys.com.hk (unknown [10.128.4.15])
        by s01.gtsys.com.hk (Postfix) with ESMTP id A0373C01FBA;
        Fri, 10 Jul 2020 10:15:37 +0800 (HKT)
Received: by armhf2.gtsys.com.hk (Postfix, from userid 1000)
        id 6A1C8202299; Fri, 10 Jul 2020 10:15:37 +0800 (HKT)
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>
Cc:     Jack Lo <jack.lo@gtsys.com.hk>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] shtc1: add support for device tree bindings
Date:   Fri, 10 Jul 2020 10:15:33 +0800
Message-Id: <20200710021536.27544-1-chris.ruehl@gtsys.com.hk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for DTS bindings to the shtc driver
The patches add the compatible table and of_property_read_bool to the
shtc1.c. Newly created Yaml document has been released to the
Documentation/devicetree/hwmon/sensirion,shtc1.yaml

Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
---
 Version 5
    devicetree/driver-source: name conversion sensirion,low-precision sensirion,blocking-io
	use const: 0x70 with the reg:
 Version 4
	Fix errors report by make dt_binding_check (devicetree)
	Set maintainers for the yaml document to my own.
 Version 3
	Fix errors report with checkpatch.pl
	Correct logic, add (!) when check for sensirion,low_precision
 Version 2
	remove the #ifdef CONFIG_OF
	ignore platform data if dev->of_node is valid
	use boolean only therefor use sensirion,low_precise to fit the logic
	add missing driver.of_match_table entry
 Version 1
	initial version
