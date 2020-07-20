Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA46225610
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jul 2020 05:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgGTDM6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 19 Jul 2020 23:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgGTDM6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Jul 2020 23:12:58 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2060C0619D4
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2020 20:12:57 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id d198so7751499vsc.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2020 20:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VTK/t0wOVgstUCjWFFumbAsOJwk/3XPeIbWLXHuzjRo=;
        b=RBUC5MP1ZoysEzfohwmNwP5dNE9+dD2ndIjWHfdgGEci67W69nOh6JF++0UupL7Osf
         mala9LAbpL4V+9Dz8q5I5kRHVYHszkRjZ5YuUkqKT50/pWR3d2sYAUqc76d9bVIXddc/
         fYF8pFyxiS03rwbQcD0Zm7c03b3vvh3xmgYrVrQQtU15/DYsmnMtleDVeun1+YlE9Yjt
         QmIv67ZqKGq1VHQoXa4mlchg65aT/8AnOhaIv1Lg04gw7oeROYPf0j/WzcoF3cZ3KxJm
         z0hoFlmrUXoVhz5rA8p5OhgQo6phsf+Hzhkrg8XEat6Qa7H0JQwtqSNPz9z4C1M/Aiqs
         i+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTK/t0wOVgstUCjWFFumbAsOJwk/3XPeIbWLXHuzjRo=;
        b=gV/YTxKC++ow4peO2b/TutDuWHelfFZ+ZcSzpkI0vrap8HhtsAKUcoqI7N/0fw6Hzs
         H+6MubWaqNOd/xwyszTg4hGWLT7qpCyP2G890gaSYTd7GL0A41faXRm+tkV/UYC4pQqB
         QvZRnQI0SQIxGDndpZkUG92AujRS5jFLqPlDBaBHFcXBf0ZcwuYIXmYtOv40ZgThBjuU
         THJ1rBDAWHI2Dr1oQPv/AfzF//77+Y3QsoeSkKbfDen+OqPYEqQ1anenqrHaa86DGmmx
         T3Kvrg+v+AAWaUaOYWaRfRINGj2TeSLJUIwK3SMPhMwQOgQTWlyvBtIXsKmbLuoHrLDi
         kbAQ==
X-Gm-Message-State: AOAM5319tKmAPxRg1KqQFqPxlF2c1SxmyGprBAUndOBw8KErxxoVDw6p
        5c/OL7vXSHRy+TkVFjfB6Eja6Wm3QuTN+Pegd8kNzQ==
X-Google-Smtp-Source: ABdhPJzdd+PpPYk4WS7IVTp2LuoN6j5bxecEV2JlREOj7/Ffe6WZuuhrl/ebvhI40+Oh7WEKIE/jOT5Yif9NFqMY2z0=
X-Received: by 2002:a67:ec58:: with SMTP id z24mr14219904vso.109.1595214775242;
 Sun, 19 Jul 2020 20:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200710004258.296017-1-linchuyuan@google.com> <20200719222222.GA78762@roeck-us.net>
In-Reply-To: <20200719222222.GA78762@roeck-us.net>
From:   Chu Lin <linchuyuan@google.com>
Date:   Sun, 19 Jul 2020 20:12:44 -0700
Message-ID: <CAKCA56CSyG3+RvmEYPpv3VC8mnmTFopd-Ee-xzF62ie80g+cag@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: adm1272: add adm1272-adm1275-temp1-en binding
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kais Belgaied <belgaied@google.com>,
        Jason Ling <jasonling@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhongqi Li <zhongqil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jul 19, 2020 at 3:22 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 10, 2020 at 12:42:58AM +0000, Chu Lin wrote:
> > Problem:
> >       adm1272 and adm1278 supports temperature sampling. The
> > current way of enabling it requires the user manually unbind the device
> > from the driver, flip the temperature sampling control bit and then bind
> > the device back to the driver. It would be nice if we can control this in a
> > better way by reading the dt.
> >
> > Solution:
> >       Introducing device tree binding adm1272-adm1278-temp1-en. If the
> > flag is set, flip the temp1_en control bit on probing.
> >
> > Testing:
> > make dt_binding_check
> >
> > Signed-off-by: Chu Lin <linchuyuan@google.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/adm1275.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> > index 1ecd03f3da4d..4403fe30f005 100644
> > --- a/Documentation/devicetree/bindings/hwmon/adm1275.txt
> > +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> > @@ -15,6 +15,8 @@ Optional properties:
> >
> >  - shunt-resistor-micro-ohms
> >       Shunt resistor value in micro-Ohm
> > +- adm1272-adm1278-temp1-en
> > +     Enable temperature sampling. This is supported on adm1272 and adm1278
>
> I suspect this should be something like "analog,temp1-enable". Either case,
> I would suggest to resend the series and copy DT maintainers at least on
> this patch.

Thanks for the heads up. I will send another review with a fix.

Thanks,
Chu
