Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B50105527
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 Nov 2019 16:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKUPPX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 21 Nov 2019 10:15:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:36212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfKUPPX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Nov 2019 10:15:23 -0500
Received: from C02WT3WMHTD6.wdl.wdc.com (unknown [199.255.45.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86D71206F4;
        Thu, 21 Nov 2019 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574349323;
        bh=fEHjqNm9XXSrwbG/QQt/3O3bpJbGuEfvd1JHCKJKC5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QoIdOpIANWLkgJlP3DULUqgquMoeEw2KOarXVhMhDdRoSFzg5RvBcvdNkBJEukHtC
         Kc4Se2O1DmlcXVvhkngksJ5wDdFojlyCsTBDO1OgTU01eiTRv9IZBT/WjwEhEqjWAV
         lYTwq7GGBVYbUOuA8bPy9L3rppC7nATbP5cOt7K8=
Date:   Thu, 21 Nov 2019 08:15:20 -0700
From:   Keith Busch <kbusch@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
Message-ID: <20191121151520.GA37858@C02WT3WMHTD6.wdl.wdc.com>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
 <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
 <20191120184827.GA12322@lst.de>
 <CAC5umyh8kbQTPh22CX6uEcR1jNEHxa+5HCjGDahnZ_i1k=cEPg@mail.gmail.com>
 <20191121142712.GC13249@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121142712.GC13249@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 21, 2019 at 06:27:12AM -0800, Guenter Roeck wrote:
> On Thu, Nov 21, 2019 at 10:48:21PM +0900, Akinobu Mita wrote:
> > 2019年11月21日(木) 3:48 Christoph Hellwig <hch@lst.de>:
> > >
> > > On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> > > > +/* These macros should be moved to linux/temperature.h */
> > > > +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> > > > +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
> > >
> > > Didn't we want to move this to a generic header?
> > 
> > Yes.  I start preparing for <linux/temperature.h>.
> > Once the change is accepted, I'll move the macros to the header.
> 
> I agree, it is better to keep that change separate.

I've added these two patches as-is for the next nvme-5.5 pull
request.
