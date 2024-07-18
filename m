Return-Path: <linux-hwmon+bounces-3175-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD509350C2
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jul 2024 18:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF5B1C20F64
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jul 2024 16:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADF3144D11;
	Thu, 18 Jul 2024 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llBfqZKJ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55077407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320811; cv=none; b=qyB3zz3/NUykdJSpfox/xi1Y6Lg+Zxhourqv2iQYmGYMg1YRR+0hbGi5h4OmLFz034gyRoL7F6vm1xmecQW7p+AWWR1JbY1Prx8ecHhbi7TPQ1Qx9mcKT3HZaQ47zBQvgv0HEokwE5sImYUwm6pFiKBZMPraBFCIjttg4j56Mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320811; c=relaxed/simple;
	bh=S0IPfgd1SvTkqSuOZ0JV8Rj44/j8NRswnBs7BZOoTwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr9HLeYZW0+uwekS8zhGYh7n6pauhPF93B6QxmBVLEqhHUKq40kqVlDzc7XzBeFVkh+E1r4xcr7/ZYffK2gYb1nqGbqA0zpQhrxcW15GD2aTosiPHt+qLW7QyNSAZGY5zbWHrK5X/nsD5WCtvnDhZ29/arQTAss7PQ9Sic3UhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llBfqZKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84414C116B1;
	Thu, 18 Jul 2024 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320811;
	bh=S0IPfgd1SvTkqSuOZ0JV8Rj44/j8NRswnBs7BZOoTwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llBfqZKJECtMaSXDpzkk+O/zK56DCosHOu67a8K6xesjYOsDIlhrOS+uzW4V+X+mJ
	 AlBBxmN+w/7jDYIfjiJtdRF6fu3WsEWzA5/57SPTYJw4Vz/qa7M3L1jEDia+8niKgV
	 hQoIUV5O2MW0JvNuSdVmLoQ/OKHjTJhLn29Zk/3xiovdu32d3mEv2J5l40pCh3teoN
	 6QIm04/FRhoRJjmF3kAD4on3s3A8ptJvHrnTE1s9K9jnIROo6C0/AqdupRXWHIknB/
	 jJqNEskGB9IFVUyl6lsRy6iUww9DMgUPZFZBacPJx+pmSx3Bi0k0XnfrVlbW9/8nLY
	 tdjyIte0++P7Q==
Date: Fri, 19 Jul 2024 00:40:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (lm95234) Convert to use regmap
Message-ID: <ZplFaFSuTufOtxX9@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-4-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:32PM -0700, Guenter Roeck wrote:
> Use regmap to replace local caching and to be able to use regmap API
> functions.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

