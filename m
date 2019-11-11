Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD0AF792D
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Nov 2019 17:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfKKQxJ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 11 Nov 2019 11:53:09 -0500
Received: from verein.lst.de ([213.95.11.211]:50463 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfKKQxJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 11:53:09 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6586568B05; Mon, 11 Nov 2019 17:53:06 +0100 (CET)
Date:   Mon, 11 Nov 2019 17:53:06 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values
 for each sensor
Message-ID: <20191111165306.GA19814@lst.de>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 10, 2019 at 11:17:46PM +0900, Akinobu Mita wrote:
> +static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
> +				long *temp)
> +{
> +	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
> +	int status;
> +	int ret;
> +
> +	if (under)
> +		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
> +
> +	ret = nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
> +				&status);
> +	if (!ret)
> +		*temp = ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000;
> +
> +	return ret <= 0 ? ret : -EIO;

This looks a little obsfucated.  aI'd prefer something like:

	if (ret > 0)
		return -EIO;
	if (ret < 0)
		return ret;
	*temp = ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000;
	return 0;

> +	return ret <= 0 ? ret : -EIO;

Similarly here, something like:

	if (ret > 0)
		return -EIO;
	return ret;

> +		err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
> +		if (err)
> +			*val = (data->ctrl->wctemp - 273) * 1000;

Can we have a helper for this (x - 273) * 1000 conversion?  It is
repeated quite a bit over the code in this file.
