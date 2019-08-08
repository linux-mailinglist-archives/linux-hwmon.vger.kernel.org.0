Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA3D85C56
	for <lists+linux-hwmon@lfdr.de>; Thu,  8 Aug 2019 10:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbfHHIC5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 8 Aug 2019 04:02:57 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:43393 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731852AbfHHIC4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Aug 2019 04:02:56 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hvdNp-0008KB-VZ; Thu, 08 Aug 2019 09:02:50 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hvdNp-0002Bi-26; Thu, 08 Aug 2019 09:02:49 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org, linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-kernel@vger.kernel.org,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v2 0/4] Add support for variable sample time in lm75 driver
Date:   Thu,  8 Aug 2019 09:02:42 +0100
Message-Id: <20190808080246.8371-1-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Hello,

The objective of following patch series is to add support to lm75 driver
to be able to configure the sample time of it's supported devices,
particularly the tmp75b.

The applied changes involve:
	* Replace the current switch-case method for configuration
	  parameters selection to a structure storing them. This method
	  allows easier management of the parameters.
	* Split the writing of configuration registers into a separate
	  function. This method saves code in later patches.
	* Include new fields in lm75_params to add support for multiple
	  sample times.
	* Split the lm75_write functionality into separate, simpler,
	  functions.
	* Add support for configuring the devices via their sysfs nodes.

The patch series was based on linux-next's master branch.

Thank you Guenter Roeck, Michael Drake, Thomas Preston and Tom Eccles for
your time, help and feedback.

Regards,

Iker Perez del Palomar Sustatxa

Iker Perez del Palomar Sustatxa (4):
  hwmon: (lm75) Create structure to save all the configuration
    parameters.
  hwmon: (lm75) Create function from code to write into registers
  hwmon: (lm75) Add new fields into lm75_params_
  hwmon: (lm75) Modularize lm75_write and make hwmon_chip writable

 drivers/hwmon/lm75.c | 390 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 274 insertions(+), 116 deletions(-)

-- 
2.11.0

