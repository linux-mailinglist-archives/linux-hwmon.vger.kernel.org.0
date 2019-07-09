Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313BB633A7
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jul 2019 11:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGIJvC (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Jul 2019 05:51:02 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53265 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGIJvC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:02 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmlz-00065y-IT; Tue, 09 Jul 2019 10:50:55 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmly-00025F-S0; Tue, 09 Jul 2019 10:50:54 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 0/5] Help with lm75.c changes
Date:   Tue,  9 Jul 2019 10:50:47 +0100
Message-Id: <20190709095052.7964-1-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Hello,

I have been working in the lm75.c driver, trying to add a variable update_time
to the tmp75b device.

I am not very confident about, if what I am doing and how I am doing it is the
best way it could be done. For that reason, I decided to send my current
changes, so maybe I could be helped and my code revised.

I decided to separate my all my changes in probably more than needed commits
because I thought that it would b easier to understand at first place. After
the feedback and my changes are ready to submit I will squash the ones that are
related between them and the patch series will be much shorter.

Thanks in advance for your help,

Regards,

Iker

Iker Perez del Palomar Sustatxa (5):
  hwmon: (lm75) Add kind field to struct lm75_data
  hwmon: (lm75) Include hwmon_chip in the permitted types to be writen
  hwmon: (lm75) Give write permission to hwmon_chip_update_interval
  hwmon: (lm75) Create function from code to write into registers
  First approach to sample time writing method

 drivers/hwmon/lm75.c | 166 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 108 insertions(+), 58 deletions(-)

-- 
2.11.0

