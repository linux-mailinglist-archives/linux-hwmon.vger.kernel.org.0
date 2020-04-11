Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C2B1A4E38
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Apr 2020 07:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgDKFnS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 11 Apr 2020 01:43:18 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45749 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgDKFnS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Apr 2020 01:43:18 -0400
Received: by mail-lf1-f68.google.com with SMTP id f8so2694333lfe.12
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2020 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO9zz0KBR/wynn9Ft/28eVjJ2+6Ay5JPkPwMahNXJB0=;
        b=iN8aMFUWHjxkXWpMkBKjfSVnqNkCGwAtn5U3enpB/pHlCrq0CBNDletdcjl806CjGp
         cHcArDiJV7m91JjXGyfjSXfxAe6CCPbzpFcbnBcX2c7jixReV2K1coSmGCQz60+tckHj
         0MYBb2BXERzyhDDmYIbKdm/MhNwdVllrVoUKyVII2Wjm9jJm5CdGy8KySu+hJUHqzOSE
         hRg3uY+bPJr/prRhUa4j81thwCH34RhIGnC+Ho0HBaIFDSVOhIxJcLEWI8y+2ji4AN50
         GH7umJ6jPSWqOycPvMS9hsksVaexzyU9uzUmDCDFbXYT/2HLuJWA+5HmuB07JeJH8Piy
         h6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO9zz0KBR/wynn9Ft/28eVjJ2+6Ay5JPkPwMahNXJB0=;
        b=BJoHgSVWjot1BURoZs47ZW9J9285WwJoCaPgWWY43QEIY2hwwhPvefLiiSirW53StP
         aaqQhan6NW2jiGG6qZ5xiG6yEbdKYK/yxizRMluNle2SZ0eQWff2MLBmVD0BBg+LsNyB
         2kHjD+BCz2TWfAdJswLB+pVpRdsMa0wFJwGAMKxgd0Z/hxuOCp/idJv3WYD6HWEhRIdD
         EJpH7z+aw0lmFcRtF226x6H4/zG6rt9f+IW1X+5+4zZcKh7DvtdW828fRxAKCUO6uD4E
         YilAD14xwEJgdY/Tp1InFDtOpz2EnPDYt7uEQyinhniPXnCeQsaCPJQDqch/4F/PupaQ
         9gyQ==
X-Gm-Message-State: AGi0PuaXf2mApiLG4VPtP4q/OlDMIvnegcjCf/WYBI15FLyxkDvZk46V
        nYfHwKAAp+fkzRZSnaOXHsoYvYjwxAFV1Vcb17I=
X-Google-Smtp-Source: APiQypIWwkLcNBWNX3q7b850z6Bp6Q58QJqOjClm5iWaj/QV3J5HOCXjef8aknDrIsW/IXVhODmRqdZ2RTWaz+SF010=
X-Received: by 2002:a19:c385:: with SMTP id t127mr4488288lff.117.1586583794810;
 Fri, 10 Apr 2020 22:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200409153939.38730-1-nchatrad@amd.com> <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
 <CAHfPSqC-1f7gSTM1X_dhjyMjcZC0SCANbukpauASGX_pAwwZbg@mail.gmail.com> <212d9b7a-d987-e21b-e59f-cc2eeab3a0af@roeck-us.net>
In-Reply-To: <212d9b7a-d987-e21b-e59f-cc2eeab3a0af@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 11 Apr 2020 11:13:03 +0530
Message-ID: <CAHfPSqDyEzJ4Yvo6ANps=fK=r+epcaRQFFd342MdMBP8X8Wm=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Sat, 11 Apr 2020 at 10:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/10/20 9:49 PM, Naveen Krishna Ch wrote:
> > Hi,
> >
> > Thank you for taking time to review and provide feedback.
> > If you can kindly address a few questions, i would start addressing
> > your comments and submit another version.
> >
>
> [ ... ]
>
> >>> +
> >>> +static ssize_t amd_core_u64_show(struct device *dev,
> >>> +             struct device_attribute *dev_attr, char *buffer)
> >>> +{
> >>> +     unsigned long long value;
> >>> +     struct sensor_data *sensor;
> >>> +     int ret = 0;
> >>> +
> >>> +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> >>> +     ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
> >>> +     if (ret)
> >>> +             return -EAGAIN;
> >>> +
> >>> +     return snprintf(buffer, 24, "%llu\n", value);
> >>
> >> It seems to me this reports raw values. This is unacceptable. Values need
> >> to be scaled to match the ABI. Energy is reported in microJoule.
> > I was of the opinion that driver provides the raw values and user-space (can use
> > float/double)  will be able to scale the value, which would involve
> > calculation of
> > "1/2^ESU * RAW value"
> >
>
> Please see Documentation/hwmon/sysfs-interface.rst. Sure, there is
> /etc/sensors3.conf, but that only applies if the kernel driver can not
> provide scaled values. This is not the case here.
I did not refer this page.
>
> FWIW, I implemented prototype code for this some time ago as
> extension of the k10temp driver, and the arithmetic wasn't that
> difficult.
Will take clues and implement.

>
> Guenter
Thank you.


-- 
Shine bright,
(: Nav :)
