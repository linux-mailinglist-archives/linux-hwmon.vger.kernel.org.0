Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B778F91EB
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 Nov 2019 15:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfKLOVa (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 12 Nov 2019 09:21:30 -0500
Received: from verein.lst.de ([213.95.11.211]:56077 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727492AbfKLOVa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 09:21:30 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 97BC668BE1; Tue, 12 Nov 2019 15:21:27 +0100 (CET)
Date:   Tue, 12 Nov 2019 15:21:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values
 for each sensor
Message-ID: <20191112142127.GA11580@lst.de>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com> <20191111165306.GA19814@lst.de> <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
> OK. I'll add two macros.
> 
> #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
> #define KELVIN_TO_MILLICELSIUS(t) (((t) - 273) * 1000)

Can you add them to linux/thermal.h that already has similar
helpers?
