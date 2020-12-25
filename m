Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB9E2E2C82
	for <lists+linux-hwmon@lfdr.de>; Fri, 25 Dec 2020 23:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgLYWz6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 25 Dec 2020 17:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgLYWz5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Dec 2020 17:55:57 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580B1C061757
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Dec 2020 14:55:17 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m25so11839013lfc.11
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Dec 2020 14:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgjsHXb/WHneIk8ytfiZho9SSMfNf0stCcaFNeLlmJo=;
        b=lUDo0krFF0crggGoL1caSrRep+JwTjAmoCsujYmJVaPnB9wSEWnuTaHiL2snK79Nis
         tEhg7LIaIGSpEDNSSBFQOEn5ACgh0ER8LuPGTg7QDJrT6Ymrz5uN1MNOVzXsa1jCl1BI
         b3XaZ71A/mH29IOC/r0WNV+gKwpGfn3mOydlcQPzfK23+8nDtfgGHMQdqZfV/bUQa+5z
         oMu10NmvGHg2Hn+pFLLCZKZaKKaOB/+xyNS58HcvBVSqVSBLAE5wtxABOPcvkgw4UdqD
         4bhKqcaBHR9jDRWS7lzdRZuafkgXjn8RuQ3EUKuyFDLNzJsJQguCFrxKFk9j2omjQtMP
         gf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgjsHXb/WHneIk8ytfiZho9SSMfNf0stCcaFNeLlmJo=;
        b=E5vggZKWUjuNz/Er727G/chbKxqbpK6+J/ceNuskdroiKpCEWi+Vf5pjBiTo+9PJjU
         rOJrO/S5dqm80zo0rTSg4kofPv1kW4P91vmrlL5yQn3CWBgKtHEaHkLC4ksbVOVX3pZt
         LxEtO7+0PGxqoAMaPQPTrQaLRBKpXm9xYEuV5bPxN0Mb6ktgahr2tQYNKwn9llK+aJ/4
         V1TUXH3cgb8lU5i+nM0VAUvl/08ma/3RMP3f1RrMExohInWL8/r1gyLBkPDlydY7O4CP
         6hWXNf6WdqRg6C8KBsYDyLl72WiIrOCU3PLYyfZkYnyPMQFB+V4uPDi+dmVkFR02muNR
         mCgQ==
X-Gm-Message-State: AOAM533ixOoP/DVJywdX/OPaXDL3SwhTT3YQe/qCCm4M/L/PVtFRrnvU
        SfFFibY8d4lolBff9phNqRZXVkfZLn3mL/2zdrd2yQ==
X-Google-Smtp-Source: ABdhPJxkmj0uNGPpRQIQfVAFgFCJ5wtfGLiiFI0Ga9kjKuA/ANtKo4D2b5QfllwFpqn6lD9ZPqlhWBxdWoBT2CqiZF4=
X-Received: by 2002:a2e:586:: with SMTP id 128mr18206952ljf.273.1608936915621;
 Fri, 25 Dec 2020 14:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20201224011607.1059534-1-linus.walleij@linaro.org> <SN6PR08MB556580B228FEC722C4A75B669ADD0@SN6PR08MB5565.namprd08.prod.outlook.com>
In-Reply-To: <SN6PR08MB556580B228FEC722C4A75B669ADD0@SN6PR08MB5565.namprd08.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Dec 2020 23:55:04 +0100
Message-ID: <CACRpkdZJT386M5y5cyCLYaWDhS+AnpXgB__VEshvYKbxN_=wPg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ntc_thermistor): try reading processed
To:     Chris Lesiak <chris.lesiak@licor.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <jic23@cam.ac.uk>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Dec 24, 2020 at 2:39 AM Chris Lesiak <chris.lesiak@licor.com> wrote:

> Please don't use iio_read_channel_processed and convert from milliVolts to
> microVolts by multiplying by 1000.  My use case requires the additional
> precision that iio_read_channel_raw followed by iio_convert_raw_to_processed
> with the 1000X scaler provides.

I have to do this change because my ADC driver only provides processed
channels (drivers/iio/adc/ab8500-gpadc.c). It provides raw values and
it provides processed values but no scale. That means your code will
not work, sadly. It will result in the raw value being used without scaling.

The reason that the ADC cannot provide scaling is that the scale is not
linear and based on calibration. IIO scaling is only linear.

After this change the driver will use the processed values directly if possible,
since these are in millivolts they need to be multiplied by 1000.

Notice that actually this NTC driver is the only driver in the entire
kernel that uses iio_convert_raw_to_processed(). (Well lmp91000.c
calls it to convert its own raw value to a processed one, so will
result in a recursive call.) I kind of find the call
dubious outside of IIO itself, it feels like calling
iio_read_channel_processed() is more
natural? Who outside of IIO needs the raw value really?
It's what I used in all of my drivers.

> But I'm unsure about keeping the fallback 12-bit ADC in place.  I kept it so as
> not to break Naveen Krishna Chatradhi's use case.  But I'm not sure it still works
> after commit adc8ec5ff183d09ae7a9d2dd31125401d302ba63
> "iio: inkern: pass through raw values if no scaling".  Before the commit,
> iio_convert_raw_to_processed returned a negative number if there was no
> scaling available.  Now, it returns the raw value.
> Does that mean that the raw value is already scaled to the correct units?
> Or does that mean that the scale is unknown and all you get is counts?

As far as I can tell it is the former of these two, as you point out
in your second mail.

Yours,
Linus Walleij
