Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC781E1E70
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 May 2020 11:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgEZJXF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 May 2020 05:23:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:34440 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728768AbgEZJXC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 05:23:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CA9A3B17F;
        Tue, 26 May 2020 09:23:03 +0000 (UTC)
Date:   Tue, 26 May 2020 11:22:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-hwmon@vger.kernel.org
Cc:     Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Questions about adt7470 driver
Message-ID: <20200526112259.4356fb2f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi all,

In the context of bug #207771, I got to look into the adt7470 driver.
I'm slowing understanding the logic of the background temperature
registers update thread, still there are 2 things I do not understand:

1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
however this value seems to be only used to limit the wait time of
future calls to the same function. In the general update function we
still read ALL temperature sensors regardless of its value:

		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
			data->temp[i] = i2c_smbus_read_byte_data(client,
						ADT7470_TEMP_REG(i));

Shouldn't this loop be bounded with data->num_temp_sensors instead of
ADT7470_TEMP_COUNT?

2* Function adt7470_read_temperatures() also sets
data->temperatures_probed to 1, and this boolean is then used to skip
further calls to that function. But do we really need a separate
variable for this, given that num_temp_sensors >= 0 matches the same
condition as far as I can see?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
