Return-Path: <linux-hwmon+bounces-149-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E87F330E
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Nov 2023 17:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11841C21C2B
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Nov 2023 16:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E475859153;
	Tue, 21 Nov 2023 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0MKkOjn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53EC139;
	Tue, 21 Nov 2023 08:02:19 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cf5901b4c8so23924615ad.1;
        Tue, 21 Nov 2023 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700582539; x=1701187339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qy5Dfsz7iJUnGTOgtQyaiSgxb//sn5YOg4PtxMP/GQ=;
        b=W0MKkOjno/s72HVORNNzEYnM0/SrknTXbtiNRhjgLlkUaohdoWHK1+LVDTD/WCBGFZ
         8uMhMimTrLrhUcaVLWjvbsXafPzD0oxweKqXjnksu11yQJ7nhl7vwYYLBgSOSbuq5UrV
         sIb6+QPEqjPW1yVkC1hzf8X5dAwqB+s/jk4QTxNhet1f8E0GnFXiBpOk2CsSGqLFsTyK
         +TXeMyo3gzXjldUTZ4JpUv+0qOFsFYCQy/RU0P/zc7luX1+vrxFAzbvCkaI1XrLR8jen
         pF7wWnryQMr58TBePQZR2XzJWHoxV5bl0logT2WSMW4CKMTdmRWcWi6Y80WMWfwAmt2K
         H8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582539; x=1701187339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qy5Dfsz7iJUnGTOgtQyaiSgxb//sn5YOg4PtxMP/GQ=;
        b=DsvtxYnnX2pllGRP6I7JRUIuCnJb3Ua7UY+PxgnXP1+ja2KvHLG3RI+KsuJ9Hqjpxi
         hkuD3Mxv4Qd3dO7tJ7jMMrw9BUFSqOZI2zIqUsv8wQzgrKVD9YgGvys0+Z1NjspYpF+c
         gga8UWHJlwYvn97aZZjnIZJXpacni1kE1bw/dqvLUiQo+OfqJyey6F7KqaRgdVD5K9No
         KnyktJxMhpvWQQ22bGPM6QhaxyjNaudHjGxondMZtGdm3AgtR5EaYJjzH52gUsl3CA5m
         Dw5mwWHPK7gfUoVGtouI3Ifcj/tGUhC7FBUsI0jab6pnu0JgmfUJbcV8qslgNOg8j0dl
         S79w==
X-Gm-Message-State: AOJu0YxUKoLn2jKvhJeYobNI0tG5BaVdTPwN7ZhXHuD5+g9ycyHsh91G
	X9qkkK4wSiOkCpPFPrNK8Nml1SI17s0=
X-Google-Smtp-Source: AGHT+IEKX7/Mja+9fgkO/8fYSDetN+HHm9BEObrNhsfsW7Tvl6OsUxP7n0dF4LDS9qw+BDawGnZcPg==
X-Received: by 2002:a17:903:c3:b0:1cc:630d:8a5e with SMTP id x3-20020a17090300c300b001cc630d8a5emr10570338plc.48.1700582539190;
        Tue, 21 Nov 2023 08:02:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jd22-20020a170903261600b001c61901ed37sm8142990plb.191.2023.11.21.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 08:02:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 21 Nov 2023 08:02:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Seo <james@equiv.tech>
Cc: Jean Delvare <jdelvare@suse.com>,
	Lukasz Stelmach <l.stelmach@samsung.com>,
	Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] hwmon: (hp-wmi-sensors) Fix failure to load on
 EliteDesk 800 G6
Message-ID: <28f9d22d-83af-4f70-9bc3-40f00a50f60a@roeck-us.net>
References: <20231105192054.24833-1-james@equiv.tech>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105192054.24833-1-james@equiv.tech>

On Sun, Nov 05, 2023 at 11:20:54AM -0800, James Seo wrote:
> The EliteDesk 800 G6 stores a raw WMI string within the ACPI object in its
> BIOS corresponding to one instance of HPBIOS_PlatformEvents.Name. This is
> evidently a valid way of representing a WMI data item as far as the Microsoft
> ACPI-WMI mapper is concerned, but is preventing the driver from loading.
> 
> This seems quite rare, but add support for such strings. Treating this as a
> quirk pretty much means adding that support anyway.
> 
> Also clean up an oversight in update_numeric_sensor_from_wobj() in which the
> result of hp_wmi_strdup() was being used without error checking.
> 
> Reported-by: Lukasz Stelmach <l.stelmach@samsung.com>
> Closes: https://lore.kernel.org/linux-hwmon/7850a0bd-60e7-88f8-1d6c-0bb0e3234fdc@roeck-us.net/
> Signed-off-by: James Seo <james@equiv.tech>
> Tested-by: Lukasz Stelmach <l.stelmach@samsung.com>

I get several checkpatch warnings when trying to apply this patch.
Please run checkpatch --strict and fix what it reports.

Thanks,
Guenter

