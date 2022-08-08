Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE558CA89
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Aug 2022 16:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbiHHOaP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hwmon@lfdr.de>); Mon, 8 Aug 2022 10:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242421AbiHHOaN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 10:30:13 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61202DEC
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 07:30:10 -0700 (PDT)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M1dns2bNrz67xX3;
        Mon,  8 Aug 2022 22:27:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 16:30:08 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 8 Aug
 2022 15:30:08 +0100
Date:   Mon, 8 Aug 2022 15:30:07 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-hwmon@vger.kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <kernel@pengutronix.de>,
        Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] hwmon: Make use of devm_clk_get_enabled()
Message-ID: <20220808153007.00007208@huawei.com>
In-Reply-To: <20220808075408.i63dtoe66hm7xwta@pengutronix.de>
References: <20220808060640.272549-1-u.kleine-koenig@pengutronix.de>
        <20220808075408.i63dtoe66hm7xwta@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 8 Aug 2022 09:54:08 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> On Mon, Aug 08, 2022 at 08:06:40AM +0200, Uwe Kleine-König wrote:
> > Several drivers manually register a devm handler to disable their clk.
> > Convert them to devm_clk_get_enabled().
> > 
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Oh, the tags by Nuno Sá and Jonathan Cameron are a fake. I picked them
> by mistake from the (similar) patch for iio. Please take care about that
> before application. (i.e. drop them, or make me resend the patch without
> the tags, or make the two give the tags post-factum :-)
> 
> Best regards and sorry for the chaos,
> Uwe
> 

Much like the IIO one you may get a request to split it by driver.
I personally prefer per driver patches as Andy suggested, but meh, it is
up to the hmwon maintainer.

I'm feeling particularly unhelpful today. As it's not IIO patches going
through another tree (like the IIO one was when I gave that tag):
+ simple patch to quickly review.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

*evil laugh*

