Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F71210439D
	for <lists+linux-hwmon@lfdr.de>; Wed, 20 Nov 2019 19:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfKTSse (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 20 Nov 2019 13:48:34 -0500
Received: from verein.lst.de ([213.95.11.211]:41752 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfKTSse (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Nov 2019 13:48:34 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9E6B268C7B; Wed, 20 Nov 2019 19:48:28 +0100 (CET)
Date:   Wed, 20 Nov 2019 19:48:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
Message-ID: <20191120184827.GA12322@lst.de>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com> <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> +/* These macros should be moved to linux/temperature.h */
> +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)

Didn't we want to move this to a generic header?

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
