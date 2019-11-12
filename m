Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0CBF93A6
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 Nov 2019 16:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfKLPIs (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 12 Nov 2019 10:08:48 -0500
Received: from verein.lst.de ([213.95.11.211]:56295 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbfKLPIs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 10:08:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9140D68BE1; Tue, 12 Nov 2019 16:08:45 +0100 (CET)
Date:   Tue, 12 Nov 2019 16:08:45 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values
 for each sensor
Message-ID: <20191112150845.GA12550@lst.de>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com> <20191111165306.GA19814@lst.de> <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com> <20191112142127.GA11580@lst.de> <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 13, 2019 at 12:00:22AM +0900, Akinobu Mita wrote:
> 2019年11月12日(火) 23:21 Christoph Hellwig <hch@lst.de>:
> >
> > On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
> > > OK. I'll add two macros.
> > >
> > > #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
> > > #define KELVIN_TO_MILLICELSIUS(t) (((t) - 273) * 1000)
> >
> > Can you add them to linux/thermal.h that already has similar
> > helpers?
> 
> Should we add a new linux/temperature.h so that any other drivers or
> subsystems (including thermal.h and hwmon.h) can use these macros?

Fine with me.
