Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F789342BBC
	for <lists+linux-hwmon@lfdr.de>; Sat, 20 Mar 2021 12:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhCTLMg (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 20 Mar 2021 07:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhCTLMN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 Mar 2021 07:12:13 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2495BC0610D0
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Mar 2021 03:56:28 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id j7so8799920qtx.5
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Mar 2021 03:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iQYzfriQFS4iM4QGzjdYe/EwNKnei3uiMSlE8+pjoTw=;
        b=RZJmA14Qn4LiKY6BI3f/uMh2na5/N/aCRPh1Pxn74IU5wK+LTAkUoMJs3JRXIujULC
         uEYz54pHgXGD/0PRED95NZMQ1GKGfWgI6T8xdCn9GjVbs+r0aZ8wzyxobxh9Y/v5+b0U
         DSNKHWZ3G0CXB8uvCQhEQz7A9Hawt7nmVwXYg0Vmix+1AKLcgUdAncZbNAOc3mY2Q0DO
         XHky0fR4qSnNI2jxx+cWWRBdl8C+vaoNs4iS9fFjAGW5hpNDOSE/VHOku8Pqh3GXwAlq
         xE5h4kZKOaDAiNtB7Q52OuYwI3u8kqLf9blWptjuIqRkfNNuu/AOxl0i6BPoTUuCD9So
         NFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iQYzfriQFS4iM4QGzjdYe/EwNKnei3uiMSlE8+pjoTw=;
        b=Pm9uTnTL2Y8c8Md9j1ek9yVS5FPwUyFaXeyvPQvu1XOSSH8NE0Pe4KXepwNo/XmHM5
         gv8wZm3NJfI0Kk43Z7/5Uih/aSvWKbjgH9PEwBihyxRxFGjlqdTBYm1dbEpfrw9yi/8s
         PB7SkQ2j+7ii9ale9h1iMYO6ZbpfodaNmEZpnoiwgmuIIF6F+D7HNJ6lYUmOioRi1vDt
         iY2dZwbqkPPSonJyLCvXdQf5Udk4DUv4sdiWq20B61/Pc2KA6otrG0KMlhGhxABCHonu
         izzLY3xEYKeH9yVoE1jPK2Dy6DnHzdj2DyRB9Grj3cb0mr8KaJDJ2t9noL2alJ9qyDVL
         iOoA==
X-Gm-Message-State: AOAM533nOAR9vAWBEkgy9YZ/OIppnT1RfiXGtreIZ4pqhpdllY1YDRCy
        z+KBECtqOUHqziwImRZfZY5e2BpRWT2WZvCL
X-Google-Smtp-Source: ABdhPJz1FMB/45PEuvrU181x6rcn5zNT04hOB3ou2ijZjBDr0Pz7vi5oxJeBK04ql8fXnQDDp8PZqg==
X-Received: by 2002:aed:2ce3:: with SMTP id g90mr1873788qtd.308.1616221794679;
        Fri, 19 Mar 2021 23:29:54 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id p7sm6221092qkc.75.2021.03.19.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 23:29:54 -0700 (PDT)
Date:   Sat, 20 Mar 2021 03:29:49 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Message-ID: <20210320062949.h2ggfmzq7lyn3zsi@calvin.localdomain>
References: <20210319045544.416138-1-jonas@protocubo.io>
 <20210319212640.GA23767@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319212640.GA23767@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 19, 2021 at 02:26:40PM -0700, Guenter Roeck wrote:
> On Fri, Mar 19, 2021 at 01:55:44AM -0300, Jonas Malaco wrote:
> > These are "all-in-one" CPU liquid coolers that can be monitored and
> > controlled through a proprietary USB HID protocol.
> > 
> > While the models have differently sized radiators and come with varying
> > numbers of fans, they are all indistinguishable at the software level.
> > 
> > The driver exposes fan/pump speeds and coolant temperature through the
> > standard hwmon sysfs interface.
> > 
> > Fan and pump control, while supported by the devices, are not currently
> > exposed.  The firmware accepts up to 61 trip points per channel
> > (fan/pump), but the same set of trip temperatures has to be maintained
> > for both; with pwmX_auto_point_Y_temp attributes, users would need to
> > maintain this invariant themselves.
> > 
> > Instead, fan and pump control, as well as LED control (which the device
> > also supports for 9 addressable RGB LEDs on the CPU water block) are
> > left for existing and already mature user-space tools, which can still
> > be used alongside the driver, thanks to hidraw.  A link to one, which I
> > also maintain, is provided in the documentation.
> > 
> > The implementation is based on USB traffic analysis.  It has been
> > runtime tested on x86_64, both as a built-in driver and as a module.
> > 
> > Signed-off-by: Jonas Malaco <jonas@protocubo.io>
> 
> Applied (after removing the now unnecessary spinlock.h include).

Thanks for catching/fixing that.

Jonas

> 
> Thanks,
> Guenter
