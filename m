Return-Path: <linux-hwmon+bounces-114-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD267F019A
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Nov 2023 18:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2241C20492
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Nov 2023 17:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656C310A21;
	Sat, 18 Nov 2023 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh1NxnNY"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C805B10C9;
	Sat, 18 Nov 2023 09:45:04 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so1666178a34.0;
        Sat, 18 Nov 2023 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329504; x=1700934304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qb1Z5fZ5kEcb/PEat1gO6JLOrll/tbZ6AWENLgKkm2A=;
        b=Yh1NxnNYzEcSi2R0NDCdJDBC0/YPNNg5ONrh1pE/EIuBr7XpT/voiKo3UBw/X4RimC
         A3i51x9M9xN6Qp0UeBrDHreIRT0chYkasGNygKB1KOZfFTaYrc4J8L+3ukdZxfW004Ey
         9g7xywDfrOrDTF/YaTnKWuU/ns72B22E05/cJevKOURSYlaE31Xp8w5bs4WSYmwN1MT7
         /87kvxbIjJsWxTQm6Yic0yjXDM4RdeXbq2LVDdu582V6PdBusx8GCKlcXeC4yltGRcSB
         X+/qDsDCsuiOojxnOKmfPPukHQN4g6YznHUeFQv0X59uZDP3I1T4HDl1fuLYnm/XJjhl
         PXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329504; x=1700934304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qb1Z5fZ5kEcb/PEat1gO6JLOrll/tbZ6AWENLgKkm2A=;
        b=RW2phIyBZPEA7Y8NDz1fycAP0mNud0vGxonlXYNV24wqy9m1xGfRGvnFineI6Qa1UT
         CLBcisasbnRzhwRf5bOiCVGrZVWwVpfOQgzWGcu2sv8Y1HyjCRTUH8e0xz0ns1wiELhh
         O2FXIoIVvWmhNzEMmp2dr6DoiHBJzz08fRI8HeqvvOFTpAMb3kfmGkbHNJwCvo3P5UPn
         joPC+8KS2KwXJ8GBxiTL9hzw6pZJK2FWyDTRcC4igk4zyC0gnQyWmkIw8VPDF01qTrrn
         c8rilh/jYiZxUtdUeckt8+LLO9l/RDKaxz7RIulX/EcwvKqSn9iUrmfkDZaPLPJpSa3r
         i/Lw==
X-Gm-Message-State: AOJu0YxU/OAYbtf2QUZjKUVDRnIEoTDKUFS64IoqleoJFli2wJb36jv5
	zqaqh+Hd2+YA8C6FxwIHkbeulEMDaEg=
X-Google-Smtp-Source: AGHT+IEiR/9sgFTTlRNkRw6NamwXS7va62a6Ub4e4Iw5bBfNaQDBna9qOunCFv5pgQu8yH73/xbR9g==
X-Received: by 2002:a9d:77cf:0:b0:6b7:5687:8a9e with SMTP id w15-20020a9d77cf000000b006b756878a9emr3227871otl.15.1700329504082;
        Sat, 18 Nov 2023 09:45:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m12-20020a9d6acc000000b006b871010cb1sm657731otq.46.2023.11.18.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:45:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Nov 2023 09:45:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ABI: sysfs-class-hwmon: rearrange humidity
 attributes alphabetically
Message-ID: <b0176205-adc7-44ba-a55a-c405a8ab1b19@roeck-us.net>
References: <20231116-hwmon_abi-v1-0-8bfb7f51145a@gmail.com>
 <20231116-hwmon_abi-v1-1-8bfb7f51145a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116-hwmon_abi-v1-1-8bfb7f51145a@gmail.com>

On Fri, Nov 17, 2023 at 07:40:34AM +0100, Javier Carrasco wrote:
> Preliminary step to add the missing humidity attributes in the ABI
> documentation.
> 
> Adding new elements alphabetically is a common practice that has been
> loosely followed in the sysfs-class-hwmon documentation. Since most of
> the humidity attributes must be added to the file, a single attribute
> needs to be rearranged to reinforce alphabetical order.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/ABI/testing/sysfs-class-hwmon | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
> index 638f4c6d4ec7..b998a42add95 100644
> --- a/Documentation/ABI/testing/sysfs-class-hwmon
> +++ b/Documentation/ABI/testing/sysfs-class-hwmon
> @@ -887,15 +887,6 @@ Description:
>  
>  		RW
>  
> -What:		/sys/class/hwmon/hwmonX/humidityY_input
> -Description:
> -		Humidity
> -
> -		Unit: milli-percent (per cent mille, pcm)
> -
> -		RO
> -
> -
>  What:		/sys/class/hwmon/hwmonX/humidityY_enable
>  Description:
>  		Enable or disable the sensors
> @@ -908,6 +899,14 @@ Description:
>  
>  		RW
>  
> +What:		/sys/class/hwmon/hwmonX/humidityY_input
> +Description:
> +		Humidity
> +
> +		Unit: milli-percent (per cent mille, pcm)
> +
> +		RO
> +
>  What:		/sys/class/hwmon/hwmonX/humidityY_rated_min
>  Description:
>  		Minimum rated humidity.

