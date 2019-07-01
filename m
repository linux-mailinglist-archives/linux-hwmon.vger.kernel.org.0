Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFE13614D
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2019 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfFEQaV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 5 Jun 2019 12:30:21 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:25447 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFEQaV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 12:30:21 -0400
X-Greylist: delayed 756 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 12:30:21 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55GHO1G032497
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 10:17:24 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55GHOOc057650
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 10:17:24 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH 0/3] Add pmbus support for Infineon IRPS5401
Date:   Wed,  5 Jun 2019 10:17:11 -0600
Message-Id: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch set adds support for the Infineon IRPS5401 PMIC to pmbus.
This chip has 5 outputs and includes separate VIN, IIN and PIN parameters
on multiple pages, which is something that the pmbus core did not
previously support.

Robert Hancock (3):
  hwmon: (pmbus) Add paged support for VIN, IIN, PIN parameters
  hwmon: (pmbus) Add paged VIN, IIN, PIN, temp detection support
  hwmon: (pmbus) add support for Infineon IRPS5401

 drivers/hwmon/pmbus/pmbus.c      | 51 +++++++++++++++++++++++-----------------
 drivers/hwmon/pmbus/pmbus_core.c |  3 +++
 2 files changed, 33 insertions(+), 21 deletions(-)

-- 
1.8.3.1

